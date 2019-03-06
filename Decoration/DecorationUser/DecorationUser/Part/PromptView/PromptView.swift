//
//  PromptView.swift
//  Miss
//
//  Created by apple on 16/12/5.
//  Copyright © 2016年 Xinguang. All rights reserved.
//

import UIKit

public enum PromptType {
    case success
    case warning
    case error
}

open class PromptView: UIView, NibLoadable {
    
    struct Animation {
        static let sx: CGFloat = 0.1
        static let sy: CGFloat = 0.1
        static let duration = 0.3
        static let damping: CGFloat = 0.6
    }
    
    struct Delay {
        static let second: Double = 1.0
    }
    
    @IBOutlet weak var backgroudView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var promptIcon: UIImageView!
    @IBOutlet weak var promptTitle: UILabel!
    @IBOutlet weak var promptDetail: UILabel!
    @IBOutlet weak var gap: NSLayoutConstraint!
    
    public typealias NibType = PromptView
    
    //消失时调用的闭包，以及展示时间
    open var hiddenHandler: (() -> Void)?
    open var showTime: Double? = 1.0
    ///  显示提示窗口
    ///
    /// - parameter title:  标题
    /// - parameter detail: 详细描述
    /// - parameter type:  提示类型
    ///
    /// - returns:	Void
    public static func show(title: String, detail: String? = nil, type: PromptType) {
        DispatchQueue.main.async {
            guard let cover = PromptView.fromNib() else {
                return
            }
            cover.setContent(title: title, detail: detail, type: type)
            CoverCarrier.add(cover)
        }
        
    }
    
    public static func show(title: String, showTime: Double? = 1.0, removeHandler: (() -> Void)?) {
        DispatchQueue.main.async {
            guard let cover = PromptView.fromNib() else {
                return
            }
            cover.setContent(title: title, detail: nil, type: .success)
            cover.showTime = showTime
            CoverCarrier.add(cover)
            cover.hiddenHandler = removeHandler
            
        }
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.frame = UIScreen.main.bounds
        setContentViewLayer()
    }
    
    private func setContent(title: String, detail: String? = nil, type: PromptType) {
        promptTitle.text = title
        if detail == nil {
            gap.constant = 0.0
        }
        promptDetail.text = detail
        
        switch type {
        case .success:
            promptIcon.image = UIImage(named: "login_icon_success")
        case .error:
            promptIcon.image = UIImage(named: "login_icon_clearblack")
        case .warning:
            promptIcon.image = UIImage(named: "login_icon_prompt")
        }
    }
    
    private func setContentViewLayer() {
        contentView.layer.cornerRadius = 4.0
//        contentView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
//        contentView.layer.shadowOpacity = 0.7
//        contentView.layer.shadowRadius = 5
//        contentView.layer.shadowColor = UIColor.lightGray.cgColor
    }
}

extension PromptView: Coverable {

    public func coverWillAppear() {
        print("coverWillAppear")
        contentView.transform = CGAffineTransform(scaleX: Animation.sx, y: Animation.sy)
        UIView.animate(withDuration: Animation.duration, delay: 0, usingSpringWithDamping: Animation.damping, initialSpringVelocity: 0, options: .curveLinear, animations: {
            self.contentView.transform = CGAffineTransform.identity
        }) { (_) in
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + showTime!) {
             CoverCarrier.hide(self)
            if let selectedHandler = self.hiddenHandler {
                selectedHandler()
            }
        }
        
    }
    
    func coverWillDisappear(removeCover: @escaping () -> Void) {
        print("coverWillDisappear")
        UIView.animate(withDuration: Animation.duration, animations: {
            self.contentView.transform = CGAffineTransform(scaleX: Animation.sx, y: Animation.sy)
            self.contentView.alpha = 0
        }) { (_) in
            self.contentView.transform = CGAffineTransform.identity
            removeCover()
        }
    }
}

