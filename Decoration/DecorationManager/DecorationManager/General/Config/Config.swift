//
//  Config.swift
//  DecorationUser
//
//  Created by ysj on 2017/11/23.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation

public struct Config {
    
    /// 当前环境名称
    static var environmentName: String {
        return Environment.current.title
    }
    
    /// 获取config.json中的 environment
    static var environmentNumber: Int {
        return Environment.current.rawValue
    }
    
    /// 业务服务器地址
    static var bussinessHost: String {
        return Environment.configs["bussinessHost"] ?? ""
    }
    
    /// 用户中心地址
    static var userCenterHost: String {
        return Environment.configs["userCenterHost"] ?? ""
    }
    
    /// 长连接地址
    static var socketHost: String {
        return Environment.configs["socketHost"] ?? ""
    }
    
    /// 长连接端口号（无需展示）
    static var socketPort: Int {
        return Int(Environment.configs["socketPort"] ?? "") ?? 0
    }
    
    /// 兔波波后台地址
    static var toobobCommonHost: String {
        return Environment.configs["toobobCommonHost"] ?? ""
    }
    
    /// 阿里推送AppKey
    public static var aliPushAppKey: String {
        return Environment.configs["aliPushAppKey"] ?? ""
    }
    
    /// 阿里推送AppSecret
    public static var aliPushAppSecret: String {
        return Environment.configs["aliPushAppSecret"] ?? ""
    }
    
    /// bugle线上id
    public static var buglyID: String {
        return Environment.configs["buglyID"] ?? ""
    }
    
    public static var LoggerEnabled: Bool {
        if Environment.configs["loggerEnable"] == "true" {
            return true
        } else {
            return false
        }
        //return Environment.configs["loggerEnable"] ?? "unknown"
    }
    
    /// 高德地图APIKey
    public static let aMapApiKey = "93664c14985b2a9f01a3fcaf3740baa6"
    
    static let loginKey = "eGluZ3Vhbmd0YmI="
    
    /// Countly
    public static let countlyHost = "http://countly.toobob.com"
    public static var countlyKey: String {
        return Environment.configs["countlyKey"] ?? ""
    }
    
    /// 版本控制项目key
    let cmsKey = "59cb0fb87d5e170664b2b58f"
    
}
