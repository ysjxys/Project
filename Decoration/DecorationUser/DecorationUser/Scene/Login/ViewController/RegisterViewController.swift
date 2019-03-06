//
//  RegisterViewController.swift
//  DecorationUser
//
//  Created by ysj on 2017/12/1.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class RegisterViewController: YSJViewController, UITextFieldDelegate {
    
    let userNameTextField = UITextField()
    let verifyCodeTextField = UITextField()
    let passwordTextField = UITextField()
    let inviteCodeTextField = UITextField()
    let sureRegisterBtn = UIButton()
    
    // MARK: - Life Circle Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNotification()
        initViews()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Custom Method
    func initNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidChanged), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
    }
    
    func initViews() {
        setTitle(title: "注册")
        
        let leftBtn = UIButton()
        leftBtn.frame = CGRect(x: 0, y: 0, width: UIScale(60), height: UIScale(44))
        leftBtn.contentHorizontalAlignment = .left
        leftBtn.setImage(#imageLiteral(resourceName: "backarrow"), for: .normal)
        leftBtn.setImage(#imageLiteral(resourceName: "backarrow"), for: .highlighted)
        leftBtn.setTitle("返回", for: .normal)
        leftBtn.setTitle("返回", for: .highlighted)
        leftBtn.titleLabel?.font = FontR(UIScale(17))
        leftBtn.setTitleColor(BlackColor, for: .normal)
        leftBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: UIScale(6), bottom: 0, right: 0)
        leftBtn.addTarget(self, action: #selector(leftBarBtnClick), for: .touchUpInside)
        
        let leftBarBtn = UIBarButtonItem(customView: leftBtn)
        navigationItem.leftBarButtonItem = leftBarBtn
    
        let userNameBackView = UIView()
        view.addSubview(userNameBackView)
        userNameBackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(UIScale(45))
            make.top.equalToSuperview().offset(HeightNavBar + HeightSystemStatus)
        }
        
        let userNameTitleLabel = createFormatTitleLabel()
        userNameTitleLabel.text = "手机号码"
        userNameBackView.addSubview(userNameTitleLabel)
        userNameTitleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(UIScale(15))
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        setFormatTextField(textField: userNameTextField)
        userNameTextField.keyboardType = .numberPad
        userNameTextField.delegate = self
        userNameTextField.placeholder = "请输入手机号"
        userNameBackView.addSubview(userNameTextField)
        userNameTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(UIScale(90))
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.right.equalToSuperview().offset(UIScale(-10))
        }
        
        userNameBackView.addBottomLine(borderWidth: CGFloat(1), color: ColorFromHex("e7e7e7"), leftDistance: UIScale(15))
        
        
        let verifyCodeBackView = UIView()
        view.addSubview(verifyCodeBackView)
        verifyCodeBackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(userNameBackView.snp.bottom)
            make.height.equalTo(userNameBackView)
        }
        
        let verifyCodeTitleLabel = createFormatTitleLabel()
        verifyCodeTitleLabel.text = "验证码"
        verifyCodeBackView.addSubview(verifyCodeTitleLabel)
        verifyCodeTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(userNameTitleLabel)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        let getVerifyCodeBtn = UIButton()
        getVerifyCodeBtn.addTarget(self, action: #selector(getVerifyCodeBtnClick), for: .touchUpInside)
        verifyCodeBackView.addSubview(getVerifyCodeBtn)
        getVerifyCodeBtn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalTo(UIScale(110))
        }
        
        let getVerifyCodeLabel = UILabel()
        getVerifyCodeLabel.text = "获取验证码"
        getVerifyCodeLabel.font = FontR(UIScale(12))
        getVerifyCodeLabel.textAlignment = .center
        getVerifyCodeLabel.textColor = ColorFromRGB(red: 0, green: 171, blue: 251)
        getVerifyCodeLabel.layer.borderColor = getVerifyCodeLabel.textColor.cgColor
        getVerifyCodeLabel.layer.borderWidth = 1
        getVerifyCodeBtn.addSubview(getVerifyCodeLabel)
        getVerifyCodeLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: UIScale(70), height: UIScale(20)))
        }
        
//        let badgeLineLabel = UILabel()
//        badgeLineLabel.backgroundColor = BlackColor
//        verifyCodeBackView.addSubview(badgeLineLabel)
//        badgeLineLabel.snp.makeConstraints { (make) in
//            make.right.equalTo(getVerifyCodeBtn.snp.left)
//            make.centerY.equalToSuperview()
//            make.width.equalTo(CGFloat(1))
//            make.height.equalToSuperview().offset(UIScale(-10))
//        }
        
        setFormatTextField(textField: verifyCodeTextField)
        verifyCodeTextField.keyboardType = .numberPad
        verifyCodeTextField.delegate = self
        verifyCodeTextField.placeholder = "请输入验证码"
        verifyCodeBackView.addSubview(verifyCodeTextField)
        verifyCodeTextField.snp.makeConstraints { (make) in
            make.left.equalTo(userNameTextField)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.right.equalTo(getVerifyCodeBtn.snp.left)
        }
        
        verifyCodeBackView.addBottomLine(borderWidth: CGFloat(1), color: ColorFromHex("e7e7e7"), leftDistance: UIScale(15))
        
        
        let passwordBackView = UIView()
        view.addSubview(passwordBackView)
        passwordBackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(verifyCodeBackView.snp.bottom)
            make.height.equalTo(userNameBackView)
        }
        
        let passwordTitleLabel = createFormatTitleLabel()
        passwordTitleLabel.text = "设置密码"
        passwordBackView.addSubview(passwordTitleLabel)
        passwordTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(userNameTitleLabel)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        setFormatTextField(textField: passwordTextField)
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "请输入6-18位密码"
        passwordBackView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.left.equalTo(userNameTextField)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.right.equalTo(userNameTextField)
        }
        
        passwordBackView.addBottomLine(borderWidth: CGFloat(1), color: ColorFromHex("e7e7e7"), leftDistance: UIScale(15))
        
        
        let inviteCodeBackView = UIView()
        view.addSubview(inviteCodeBackView)
        inviteCodeBackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(passwordBackView.snp.bottom)
            make.height.equalTo(userNameBackView)
        }
        
        let inviteCodeTitleLabel = createFormatTitleLabel()
        inviteCodeTitleLabel.text = "邀请码"
        inviteCodeBackView.addSubview(inviteCodeTitleLabel)
        inviteCodeTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(userNameTitleLabel)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        setFormatTextField(textField: inviteCodeTextField)
        inviteCodeTextField.keyboardType = .numberPad
        inviteCodeTextField.placeholder = "请输入邀请码，获得管家币"
        inviteCodeTextField.delegate = self
        inviteCodeBackView.addSubview(inviteCodeTextField)
        inviteCodeTextField.snp.makeConstraints { (make) in
            make.left.equalTo(userNameTextField)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.right.equalTo(userNameTextField)
        }
        
        inviteCodeBackView.addBottomLine()
        
        sureRegisterBtn.clipsToBounds = true
        sureRegisterBtn.isEnabled = false
        sureRegisterBtn.layer.cornerRadius = UIScale(3)
        sureRegisterBtn.setTitle("确认", for: .normal)
        sureRegisterBtn.setTitleColor(WhiteColor, for: .normal)
        sureRegisterBtn.setButtonBackgroundColor(color: ColorFromRGB(red: 0, green: 171, blue: 251), forState: .normal)
        sureRegisterBtn.setButtonBackgroundColor(color: ColorFromRGB(red: 204, green: 204, blue: 204), forState: .disabled)
        sureRegisterBtn.addTarget(self, action: #selector(sureRegisterBtnClick), for: .touchUpInside)
        view.addSubview(sureRegisterBtn)
        sureRegisterBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(inviteCodeBackView.snp.bottom).offset(UIScale(40))
            make.size.equalTo(CGSize(width: UIScale(345), height: UIScale(50)))
        }
        
        userNameTextField.text = "15067199246"
        passwordTextField.text = "Aa12345678"
        verifyCodeTextField.text = "1234"
    }
    
    func createFormatTitleLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.font = FontR(UIScale(15))
        titleLabel.textColor = ColorFromRGB(red: 26, green: 26, blue: 26)
        titleLabel.textAlignment = .left
        return titleLabel
    }
    
    func setFormatTextField(textField: UITextField) {
        textField.clearButtonMode = .whileEditing
        textField.font = FontR(UIScale(12))
        textField.textColor = ColorFromRGB(red: 26, green: 26, blue: 26)
    }
    
    // MARK: - BtnClick Method
    @objc func leftBarBtnClick() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func getVerifyCodeBtnClick() {
        
    }
    
    @objc func sureRegisterBtnClick() {
        print("注册")
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        verifyCodeTextField.resignFirstResponder()
        inviteCodeTextField.resignFirstResponder()
        
        guard let phone = userNameTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        guard let verifyCode = verifyCodeTextField.text else {
            return
        }
        var inviteCode: String? = nil
        if let text = inviteCodeTextField.text {
            inviteCode = text
        }
        
        guard AccountOperation.shared.check(mobilePhone: phone) else {
            return
        }
        guard AccountOperation.shared.check(password: password) else {
            return
        }
        
        AccountOperation.shared.register(mobile: phone, password: password, verifyCode: verifyCode) { (response) in
            PromptView.show(title: "注册成功", removeHandler: {
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            })
        }
    }
    
    // MARK: - TextField Notification Method
    @objc func textFieldDidChanged() {
        if userNameTextField.text != nil && verifyCodeTextField.text != nil && passwordTextField.text != nil && userNameTextField.text != "" && verifyCodeTextField.text != "" && passwordTextField.text != "" {
            sureRegisterBtn.isEnabled = true
        } else {
            sureRegisterBtn.isEnabled = false
        }
    }
    
    // MARK: - TextField Delegate Method
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == userNameTextField {
            if range.location > 10 {
                return false
            }
            guard NumberValidator.init(input: string).validate() || string == "" else {
                return false
            }
            return true
        }
        
        if textField == verifyCodeTextField {
            if range.location > 5 {
                return false
            }
            return true
        }
        
        if textField == passwordTextField {
            if range.location > 17 {
                return false
            }
            return true
        }
        
        if textField == inviteCodeTextField {
            if range.location > 5 {
                return false
            }
            guard NumberValidator.init(input: string).validate() || string == "" else {
                return false
            }
            return true
        }
        
        return true
    }
}
