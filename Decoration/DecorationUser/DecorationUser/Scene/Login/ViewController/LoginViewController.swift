//
//  LoginViewController.swift
//  DecorationUser
//
//  Created by ysj on 2017/11/24.
//  Copyright © 2017年 ysj. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: YSJViewController, UITextFieldDelegate {
    
    let deleteUserNameBtnTag = 1
    let deletePasswordBtnTag = 2
    
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    
    public var successLogin: (() -> Void)?
    
    // MARK: - Life Circle Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
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
//        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidChanged), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
    }
    
    func createTextFieldLeftView(image: UIImage) -> UIView {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: UIScale(45), height: UIScale(50)))
        leftView.backgroundColor = ClearColor
        
        let imageView = UIImageView(frame: CGRect(x: UIScale(15), y: UIScale(14), width: UIScale(18), height: UIScale(22)))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        leftView.addSubview(imageView)
        
        return leftView
    }
    
    func setTextFieldFormat(textField: UITextField, placeHold: String, deleteBtnTag: Int) {
        
        textField.layer.cornerRadius = UIScale(UIScale(25))
        textField.layer.backgroundColor = ColorFromHex("ffffff", 0.1).cgColor
        textField.leftViewMode = .always
        textField.font = FontR(UIScale(15))
        textField.textColor = ColorFromHex("ffffff", 0.6)
        
        let attributedString = NSMutableAttributedString(string: placeHold)
        attributedString.addAttributes([
            NSAttributedStringKey.foregroundColor: ColorFromHex("ffffff", 0.6)
            ], range: NSRange(location: 0, length: placeHold.count))
        
        textField.attributedPlaceholder = attributedString
        textField.delegate = self
        
        let deleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: UIScale(40), height: UIScale(40)))
        deleteButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScale(16))
        deleteButton.setImage(#imageLiteral(resourceName: "shanchu"), for: .normal)
        deleteButton.setImage(#imageLiteral(resourceName: "shanchu"), for: .highlighted)
        deleteButton.contentMode = .center
        deleteButton.addTarget(self, action: #selector(delelteBtnClick(btn:)), for: .touchUpInside)
        deleteButton.tag = deleteBtnTag
        
        textField.rightView = deleteButton
        textField.rightViewMode = .whileEditing
    }
    
    func initViews() {
        let backImageView = UIImageView()
        backImageView.backgroundColor = ColorFromRGB(red: 52, green: 88, blue: 175)
        backImageView.image = #imageLiteral(resourceName: "bg")
        backImageView.contentMode = .scaleToFill
        view.addSubview(backImageView)
        backImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        let backBtn = UIButton()
        backBtn.contentMode = .center
        backBtn.setImage(#imageLiteral(resourceName: "fanhui"), for: .normal)
        backBtn.setImage(#imageLiteral(resourceName: "fanhui"), for: .highlighted)
        backBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.left.equalTo(UIScale(5))
            make.top.equalTo(HeightSystemStatus)
            make.size.equalTo(CGSize(width: UIScale(50), height: UIScale(44)))
        }
        
        let logoImageView = UIImageView()
        logoImageView.backgroundColor = ClearColor
        logoImageView.image = #imageLiteral(resourceName: "logo-11-4")
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(HeightSystemStatus + UIScale(60))
            make.size.equalTo(CGSize(width: UIScale(75), height: UIScale(75)))
        }
        
        let titleImageView = UIImageView()
        titleImageView.image = #imageLiteral(resourceName: "logoTitle")
        titleImageView.contentMode = .scaleAspectFit
        view.addSubview(titleImageView)
        titleImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: UIScale(100), height: UIScale(10)))
            make.top.equalTo(logoImageView.snp.bottom).offset(UIScale(10))
        }
        
        
        setTextFieldFormat(textField: userNameTextField, placeHold: "请输入手机号码", deleteBtnTag: deleteUserNameBtnTag)
        userNameTextField.leftView = createTextFieldLeftView(image: #imageLiteral(resourceName: "yonghuming"))
        userNameTextField.keyboardType = .numberPad
        view.addSubview(userNameTextField)
        userNameTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: UIScale(300), height: UIScale(50)))
            make.top.equalTo(logoImageView.snp.bottom).offset(UIScale(60))
        }
        
        setTextFieldFormat(textField: passwordTextField, placeHold: "请输入6-18位登录密码", deleteBtnTag: deletePasswordBtnTag)
        passwordTextField.leftView = createTextFieldLeftView(image: #imageLiteral(resourceName: "mima"))
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(userNameTextField)
            make.size.equalTo(userNameTextField)
            make.top.equalTo(userNameTextField.snp.bottom).offset(UIScale(20))
        }

        let loginBtn = UIButton()
        loginBtn.clipsToBounds = true
        loginBtn.layer.cornerRadius = UIScale(25)
        loginBtn.titleLabel?.font = FontR(UIScale(17))
        loginBtn.contentMode = .center
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(WhiteColor, for: .normal)
        loginBtn.setButtonBackgroundColor(color: ColorFromRGB(red: 0, green: 171, blue: 251), forState: .normal)
        loginBtn.setButtonBackgroundColor(color: ColorFromRGB(red: 0, green: 171, blue: 251), forState: .highlighted)
        loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(passwordTextField)
            make.top.equalTo(passwordTextField.snp.bottom).offset(UIScale(20))
            
        }

        let centerLineLabel = UILabel()
        centerLineLabel.backgroundColor = WhiteColor
        view.addSubview(centerLineLabel)
        centerLineLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginBtn.snp.bottom).offset(UIScale(20))
            make.size.equalTo(CGSize(width: CGFloat(1), height: UIScale(20)))
        }

        let forgetPWDBtn = UIButton()
        forgetPWDBtn.titleLabel?.font = FontR(UIScale(13))
        forgetPWDBtn.contentMode = .right
        forgetPWDBtn.setTitle("忘记密码", for: .normal)
        forgetPWDBtn.setTitleColor(WhiteColor, for: .normal)
        forgetPWDBtn.backgroundColor = ClearColor
        forgetPWDBtn.addTarget(self, action: #selector(forgetBtnClick), for: .touchUpInside)
        view.addSubview(forgetPWDBtn)
        forgetPWDBtn.snp.makeConstraints { (make) in
            make.right.equalTo(centerLineLabel.snp.left).offset(UIScale(-25))
            make.centerY.equalTo(centerLineLabel)
        }

        let registerBtn = UIButton()
        registerBtn.titleLabel?.font = FontR(UIScale(13))
        registerBtn.contentMode = .left
        registerBtn.setTitle("立即注册", for: .normal)
        registerBtn.setTitleColor(WhiteColor, for: .normal)
        registerBtn.backgroundColor = ClearColor
        registerBtn.addTarget(self, action: #selector(registerBtnClick), for: .touchUpInside)
        view.addSubview(registerBtn)
        registerBtn.snp.makeConstraints { (make) in
            make.left.equalTo(centerLineLabel.snp.right).offset(UIScale(25))
            make.centerY.equalTo(centerLineLabel)
        }
    }
    
    // MARK: - BtnClick Method
    @objc func backBtnClick() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func delelteBtnClick(btn: UIButton) {
        if btn.tag == deleteUserNameBtnTag {
            userNameTextField.text = ""
        }
        if btn.tag == deletePasswordBtnTag {
            passwordTextField.text = ""
        }
    }
    
    @objc func loginBtnClick() {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        guard let phone = userNameTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        
        guard AccountOperation.shared.check(mobilePhone: phone) else {
            return
        }
        guard AccountOperation.shared.check(password: password) else {
            return
        }
        
        AccountOperation.shared.login(mobile: phone, password: password) { (response) in
            print(response)
        }
    }
    
    @objc func forgetBtnClick() {
        navigationController?.pushViewController(ForgetPasswordViewController(), animated: true)
    }
    
    @objc func registerBtnClick() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    // MARK: - TextField Delegate Method
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//            if let text = textField.text {
//                let endIndex = text.index(text.startIndex, offsetBy: 11)
//                let newStr = String(text[..<endIndex])
//                textField.text = newStr
//            }
        if textField == userNameTextField {
            if range.location > 10 {
                return false
            }
            guard NumberValidator.init(input: string).validate() || string == "" else {
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
        return true
    }
}
