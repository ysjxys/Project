//
//  DealErrorCode.swift
//  DecorationUser
//
//  Created by ysj on 2017/12/6.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation

enum ErrorCodeType: Int {
    //未知错误
    case errorTypeUnknow = 0
    //登录名或密码错误
    case errorTypeUserNamePasswordError = 4003
    //用户不存在
    case errorTypeUserNotExist = 4004
    //用户不可用
    case errorTypeUserFrozen = 4005
    //用户已存在
    case errorTypeUserAlreadyExist = 4006
    //验证码错误
    case errorTypeVerifyCodeError = 4008
    
}

func getErrorCodeType(code: Int) -> ErrorCodeType {
    return ErrorCodeType.init(rawValue: code) ?? .errorTypeUnknow
}

func dealErrorCode(resultCode: Int?, resultMsg: String?) {
    guard let code = resultCode else {
        return
    }
    
    let msg = resultMsg ?? ""
    
    PromptView.show(title: "系统报错\(code) \(msg)", type: .error)
    
    let errorType = getErrorCodeType(code: resultCode ?? 0)
    
    switch errorType {
    case .errorTypeUserAlreadyExist:    //用户已存在
        print(errorType.hashValue)
        
    case .errorTypeUserFrozen:  //用户不可用
        print(errorType.hashValue)
        
    case .errorTypeUserNamePasswordError:   //登录名或密码错误
        print(errorType.hashValue)
        
    case .errorTypeUserNotExist:    //用户不存在
        print(errorType.hashValue)
        
    case .errorTypeVerifyCodeError:     //验证码错误
        print(errorType.hashValue)
        
    case .errorTypeUnknow:  //未知错误
        showAlertUnKnowError()
    }
}
