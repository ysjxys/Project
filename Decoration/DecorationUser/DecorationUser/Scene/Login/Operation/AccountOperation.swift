//
//  AccountOperation.swift
//  DecorationUser
//
//  Created by ysj on 2017/12/1.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation

class AccountOperation {
    
    private init() {}
    static let shared = AccountOperation()
    
    func check(mobilePhone mobile: String) -> Bool {
        guard PhoneValidator(input: mobile).validate() else {
            PromptView.show(title: "手机号有误，请重试", type: .warning)
            return false
        }
        return true
    }
    
    func check(password: String) -> Bool {
        guard PasswordValidator(input: password).validate() else {
            PromptView.show(title: "密码格式错误", detail: "密码6~18位数（数字+大小写字母）", type: .warning)
            return false
        }
        return true
    }
    
    func register(mobile: String, password: String, verifyCode: String, successHandle: @escaping (UserRegisterModel) -> Void) {
        
        YSJHttpAPI.send(request: UserRegisterRequest(mobile: mobile, password: password, verifyCode: verifyCode), successHandle: { (response) in
            
            if let model = response {
                successHandle(model)
            } else {
                showAlertDataAnalysisError()
            }
        },  unSuccessHandle: { (resultCode, resultMsg) in
            dealErrorCode(resultCode: resultCode, resultMsg: resultMsg)
        }, failHandle: { (error) in
            showAlertSystemBusy()
        }, netErrorHandle: {
            showAlertNetError()
        })
    }
    
    func login(mobile: String, password: String, successHandle: @escaping (UserLoginModel) -> Void) {
        
        YSJHttpAPI.send(request: UserLoginRequest(mobile: mobile, password: password), successHandle: { (response) in
            if let model = response {
                successHandle(model)
            } else {
                showAlertDataAnalysisError()
            }
        }, unSuccessHandle: { (resultCode, resultMsg) in
            dealErrorCode(resultCode: resultCode, resultMsg: resultMsg)
        }, failHandle: { (error) in
            showAlertSystemBusy()
        }) {
            showAlertNetError()
        }
    }
}
