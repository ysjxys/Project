//
//  LoginViewController.swift
//  DecorationUser
//
//  Created by ysj on 2017/11/24.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: YSJViewController {
    
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    
    public var successLogin: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.text = "haha"
        view.addSubview(userNameTextField)
        userNameTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: UIScale(200), height: UIScale(50)))
            make.top.equalTo(HeightSystemStatus + HeightNavBar + 200)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
