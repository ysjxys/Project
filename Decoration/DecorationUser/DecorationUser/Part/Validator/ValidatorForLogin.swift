//
//  ValidatorForLogin.swift
//  Pods
//
//  Created by admin on 2017/9/25.
//
//

import Foundation

class PasswordValidator: SimpleValidator {
    private var _inputStr: String?
    var inputStr: String? {
        return _inputStr
    }
    
    var regularExpression: String? {
        return "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,18}$"
    }
    
    init(input: String?) {
        _inputStr = input
    }
}
