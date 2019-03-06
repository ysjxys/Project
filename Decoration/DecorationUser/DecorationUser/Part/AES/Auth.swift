//
//  Auth.swift
//  DecorationUser
//
//  Created by ysj on 2017/12/6.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation

extension String {
    public var aes128Encrypt: String {
        let hexString = AESUtil.aes128Encrypt(self, withKey: "eGluZ3Vhbmd0YmI=")
        guard let string = hexString else {
            return ""
        }
        return string
    }
}
