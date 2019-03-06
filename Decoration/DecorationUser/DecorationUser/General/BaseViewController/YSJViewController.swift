//
//  YSJViewController.swift
//  YSJSwiftLibrary
//
//  Created by ysj on 2016/12/20.
//  Copyright © 2016年 ysj. All rights reserved.
//

import Foundation
import UIKit

class YSJViewController: UIViewController {
    
    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 44)
        titleLabel.font = FontR(UIScale(17))
        titleLabel.textColor = BlackColor
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
    }
    
    func setTitle(title: String) {
        titleLabel.text = title
    }
}
