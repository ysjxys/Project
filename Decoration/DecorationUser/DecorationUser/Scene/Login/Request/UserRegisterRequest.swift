//
//  RegisterRequest.swift
//  DecorationUser
//
//  Created by ysj on 2017/12/6.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation

struct UserRegisterRequest: YSJHttpRequest {
    let mobile: String
    let password: String
    let verifyCode: String
    
    var header: [String : String]? {
        return nil
    }
    
    var host: String {
        return "http://dsn.apizza.cc/mock/0579e020ad821aa0745ae8625793354c/app/rest"
    }
    
    var path: String {
        return "/user/register"
    }
    
    let method: Method = .post
    
    typealias Model = UserRegisterModel
    
    var param: [String : Any]? {
        var params = [String: Any]()
        params["mobile"] = mobile
        params["password"] = password
        params["verifyCode"] = verifyCode
        return params
    }
}
