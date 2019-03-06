//
//  NibLoadable.swift
//  Cover
//
//  Created by marui on 16/12/15.
//  Copyright © 2016年 marui. All rights reserved.
//
import Foundation
import UIKit

public protocol NibLoadable {
    ///
    associatedtype NibType
    /// 加载nib文件
    static func fromNib() -> NibType?
}

extension NibLoadable where Self: UIView {
    public static func fromNib() -> NibType? {
        /// 获取模块前缀
        let modulePrefix: String = {
            
            if let info = Bundle(for: self).infoDictionary {
                let executable = info[kCFBundleExecutableKey as String] as? String ?? ""
                return executable + "."
            }
            
            return ""
        }()
        
        let nibViewName = String(describing: Self.self).replacingOccurrences(of: modulePrefix, with: "")
        
        guard (Bundle(for: self).path(forResource: nibViewName, ofType: "nib") != nil) else {
            return nil
        }
        
        guard let object = Bundle(for: self).loadNibNamed(nibViewName, owner: nil, options: nil)?.first else {
            return nil
        }
        
        guard let view = object as? NibType else {
            return nil
        }
        
        return view
    }
}
