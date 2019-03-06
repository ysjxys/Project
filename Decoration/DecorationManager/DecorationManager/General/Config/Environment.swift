//
//  Environment.swift
//  DecorationUser
//
//  Created by ysj on 2017/11/23.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation

enum Environment: Int {
    /// 正式环境
    case production = 0
    /// 测试环境
    case test = 1
    
    /// 配置文件中环境配置的key
    private static let environmentKey = "environment"
    
    /// 配置文件名
    private static let fileName = "config"
    
    /// 配置文件类型
    private static let fileType = "json"
    
    /// 所有配置项的 key
    private static let configsKey = "configs"
    
    /// 配置文件每个环境对应的 key
    private var key: String {
        switch self {
        case .production:
            return "production"
        case .test:
            return "test"
        }
    }
    
    /// 环境对应名称
    var title: String {
        switch self {
        case .production:
            return "生产环境"
        case .test:
            return "测试环境"
        }
    }
    
    /// 当前配置环境
    static var current: Environment {
        return getCurrentEnvironment()
    }
    
    /// 当前环境下的所有配置
    static var configs: [String: String] {
        return getCurrentConfigs()
    }
    
    /// 获取配置环境
    ///
    /// - Returns: 配置环境
    private static func getCurrentEnvironment() -> Environment {
        if let value = UserDefaults.standard.value(forKey: environmentKey) as? Int, let environment = Environment(rawValue: value) {
            return environment
        }
        
        guard let dictionary = dictionaryFromConfigFile(), let value = dictionary[environmentKey] as? Int, let environment = Environment(rawValue: value) else {
            return .test
        }
        return environment
    }
    
    /// 获取当前环境下的所有配置项
    ///
    /// - Returns: 具体的配置项数组
    private static func getCurrentConfigs() -> [String: String] {
        guard let dictionary = dictionaryFromConfigFile(), let configs = dictionary[configsKey] as? [String: [String: String]], let result = configs[current.key] else {
            return [:]
        }
        return result
    }
    
    /// 读取配置文件
    ///
    /// - Returns: json 转换的字典
    private static func dictionaryFromConfigFile() -> [String: Any]? {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: fileType) else {
            return nil
        }
        let fileURL = URL(fileURLWithPath: filePath)
        do {
            let fileData = try Data(contentsOf: fileURL)
            let json = try JSONSerialization.jsonObject(with: fileData, options: .allowFragments)
            
            guard let dict = json as? [String: Any] else {
                return nil
            }
            return dict
        } catch _ {
            return nil
        }
    }
}
