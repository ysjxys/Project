//
//  UserLoginRequest.swift
//  DecorationUser
//
//  Created by ysj on 2017/12/7.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation

struct UserLoginRequest: YSJHttpRequest {
    let mobile: String
    let password: String
    
    var header: [String : String]? {
        return nil
    }
    
    var host: String {
        return "http://dsn.apizza.cc/mock/0579e020ad821aa0745ae8625793354c/app/rest"
    }
    
    var path: String {
        return "/user/login"
    }
    
    let method: Method = .post
    
    typealias Model = UserLoginModel
    
    var param: [String : Any]? {
        var params = [String: Any]()
        params["mobile"] = mobile
        params["password"] = password
        return params
    }
}
