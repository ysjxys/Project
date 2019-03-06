//
//  Coverable.swift
//  Miss
//
//  Created by apple on 16/12/15.
//  Copyright © 2016年 Xinguang. All rights reserved.
//

import Foundation
import UIKit
public protocol Coverable {
        func coverWillAppear()
        func coverWillDisappear(removeCover: () -> Void)
}

extension Coverable where Self: UIView {
    func coverWillAppear() {
        
    }
    
    public func coverWillDisappear(removeCover: () -> Void) {
        self.removeFromSuperview()
    }
}

public struct CoverCarrier {
    public static func add(_ cover: Coverable) {
        for view in  UIApplication.shared.keyWindow!.subviews {
            if view is Coverable {
                view.removeFromSuperview()
            }
        }
        
        guard let view = cover as? UIView else {
            return
        }
        
        UIApplication.shared.keyWindow!.addSubview(view)
        
        cover.coverWillAppear()
    }
    
    public static func hide(_ cover: Coverable) {
        cover.coverWillDisappear {
            guard let view = cover as? UIView else {
                return
            }
            view.removeFromSuperview()
        }
    }
    
    public static func hide() {
        for view in  UIApplication.shared.keyWindow!.subviews {
            
            guard let cover = view as? Coverable else {
                continue
            }
            
            cover.coverWillDisappear(removeCover: { 
                view.removeFromSuperview()
            })
        }
    }
}
