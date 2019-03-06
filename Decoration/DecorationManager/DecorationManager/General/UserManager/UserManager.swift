//
//  UserManager.swift
//  DecorationUser
//
//  Created by ysj on 2017/11/24.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation

let kUserToken = "kUserToken"
let kUserPhone = "kUserPhone"
let kUserPassWord = "kUserPassWord"
let kUserId = "kUserId"
let kUserName = "kUserName"

public class UserManager: NSObject {
    
    public static let shared = UserManager()
    private var lock: NSLock = NSLock()
    
    override init() {
        super.init()
    }
    
    // MARK: - user token
    var userToken: String? {
        set {
            if let newValue = newValue {
               lock.lock()
                Store.persistentStore().setObject(DataType.string(newValue), forKey: kUserToken)
            } else {
                Store.persistentStore().setObject(DataType.null, forKey: kUserToken)
            }
        }
        
        get {
            if case .string(let token) = Store.persistentStore().objectForKey(kUserToken) {
                return token
            }
            return nil
        }
    }
    
    var userPhone: String? {
        set {
            if let newValue = newValue {
                Store.persistentStore().setObject(DataType.string(newValue), forKey: kUserPhone)
            } else {
                Store.persistentStore().setObject(DataType.null, forKey: kUserPhone)
            }
        }
        get {
            if case .string(let phone) = Store.persistentStore().objectForKey(kUserPhone) {
                return phone
            }
            return nil
        }
    }
    
    var userPassWord: String? {
        set {
            if let newValue = newValue {
                Store.persistentStore().setObject(DataType.string(newValue), forKey: kUserPassWord)
            } else {
                Store.persistentStore().setObject(DataType.null, forKey: kUserPassWord)
            }
        }
        get {
            if case .string(let passWord) = Store.persistentStore().objectForKey(kUserPassWord) {
                return passWord
            }
            return nil
        }
    }
    
    var userId: String? {
        set {
            if let newValue = newValue {
                Store.persistentStore().setObject(DataType.string(newValue), forKey: kUserId)
            } else {
                Store.persistentStore().setObject(DataType.null, forKey: kUserId)
            }
        }
        get {
            if case .string(let userId) = Store.persistentStore().objectForKey(kUserId) {
                return userId
            }
            return nil
        }
    }
    
    var userName: String? {
        set {
            if let newValue = newValue {
                Store.persistentStore().setObject(DataType.string(newValue), forKey: kUserName)
            } else {
                Store.persistentStore().setObject(DataType.null, forKey: kUserName)
            }
        }
        get {
            if case .string(let name) = Store.persistentStore().objectForKey(kUserName) {
                return name
            }
            return nil
        }
    }
    
}

extension UserManager {
    
    public var isLogin: Bool {
        return userToken != nil
    }
    
    public func cleanToken() {
        userToken = nil
    }
}
