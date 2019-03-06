//
//  Validator.swift
//  CustomExtension
//
//  Created by CC on 2017/9/22.
//  Copyright © 2017年 xinguangnet. All rights reserved.
//

import UIKit

public protocol Validator {
    func validate() -> Bool
}

public protocol SimpleValidator: Validator{
    
    var inputStr: String? { get }
    
    var regularExpression: String? { get }
}

extension SimpleValidator{
    
    public func validate() -> Bool {
        guard let input = inputStr, !input.isEmpty else{
            return false
        }
        
        guard let expressionStr = regularExpression else{
            return false
        }
        
        do{
            let expression = try NSRegularExpression(pattern: expressionStr, options:[])
            let range = NSMakeRange(0, input.characters.count)
            let matchRange = expression.rangeOfFirstMatch(in: input, options: [], range: range)
            if (range.location == matchRange.location) && (range.length == matchRange.length){
                return true
            }
            
        }catch{
            return false
        }
        
        return false
    }
    
}

// MARK: - 

public class PhoneValidator: SimpleValidator{
    private var _inputStr: String?
    public var inputStr: String?{
        return _inputStr
    }
    
    public var regularExpression: String?{
        return "^1[3|5|7|8|][0-9]{9}$"
    }
    
    public init(input: String?){
        _inputStr = input
    }
}

public class ChineseValidator: SimpleValidator {
    private var _inputStr: String?
    public var inputStr: String? {
        return _inputStr
    }
    
    //字符串中“/”需要变成"\\"才能编译
    public var regularExpression: String? {
        return "^([\\u4e00-\\u9fa5]){1,8}$"
    }
    
    public init(input: String?) {
        _inputStr = input
    }
    
}

public class EmailValidator: SimpleValidator {
    private var _inputStr: String?
    public var inputStr: String?{
        return _inputStr
    }
    
    public var regularExpression: String?{
        return "^[a-z_0-9.-]{1,64}@([a-z0-9-]{1,200}.){1,5}[a-z]{1,6}$"
    }
    
    public init(input: String?){
        _inputStr = input
    }
}

public class IDCardValidator: SimpleValidator {
    private var _inputStr: String?
    public var inputStr: String? {
        return _inputStr
    }
    
    public var regularExpression: String? {
        return "^([1-9]\\d{5}[1-9]\\d{3}((0[1-9])|(1[0-2]))((0[1-9])|([1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx]))|([1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3})$"
    }
    
    public init(input: String?){
        _inputStr = input
    }
}

// 英文和数字：^[A-Za-z0-9]+$ 或 ^[A-Za-z0-9]{4,40}$

public class NumberValidator: SimpleValidator {
    private var _inputStr: String?
    public var inputStr: String? {
        return _inputStr
    }
    
    public var regularExpression: String? {
        return "^[0-9]*$"
    }
    
    public init(input: String?){
        _inputStr = input
    }
}

public class LetterValidator: SimpleValidator {
    private var _inputStr: String?
    public var inputStr: String? {
        return _inputStr
    }
    
    public var regularExpression: String? {
        return "^[A-Za-z]+$"
    }
    
    public init(input: String?){
        _inputStr = input
    }
}

public class NumberLetterValidator: SimpleValidator {
    private var _inputStr: String?
    public var inputStr: String? {
        return _inputStr
    }
    
    public var regularExpression: String? {
        return "^[A-Za-z0-9]+$"
    }
    
    public init(input: String?){
        _inputStr = input
    }
}
