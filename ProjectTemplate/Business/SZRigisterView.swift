//
//  SZRigisterView.swift
//  Business
//
//  Created by !>-<! on 2019/3/4.
//  Copyright © 2019 !>-<!. All rights reserved.
//

import UIKit
import Material

public class SZRigisterView: UIView {
    public var phoneField: ErrorTextField!
    public var nameField: ErrorTextField!
    public var sex: UILabel!
    public var sexControl: Switch!
    public var ageField: ErrorTextField!
    public var passwordField: TextField!
    public var comentsField: TextField!

    public var delegate: SZRigisterViewController?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func draw(_ rect: CGRect) {
        prepareUI()
    }
    
    func prepareUI() {
        preparePhoneField()
        prepareNameField()
        prepareSexField()
        prepareAgeField()
        preparePasswordField()
        prepareComentsField()
        preparConfirmBtn()
    }
    
    func preparePhoneField() {
        phoneField                          = ErrorTextField()
        phoneField.placeholder              = "手机号"
        phoneField.isClearIconButtonEnabled = true
        phoneField.delegate                 = delegate
        phoneField.dividerActiveColor       = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        phoneField.leftViewActiveColor      = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        phoneField.placeholderActiveColor   = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        
        let leftView                        = UIImageView()
        leftView.image                      = Icon.phone
        phoneField.leftView                 = leftView
        
        addSubview(phoneField)
        phoneField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(90)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        
        
    }
    
    func prepareNameField() {
        nameField                          = ErrorTextField()
        nameField.placeholder              = "姓名"
        nameField.isClearIconButtonEnabled = true
        nameField.delegate                 = delegate
        nameField.dividerActiveColor       = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        nameField.leftViewActiveColor      = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        nameField.placeholderActiveColor   = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        
        let leftView                        = UIImageView()
        leftView.image                      = Icon.home
        nameField.leftView                 = leftView
        
        addSubview(nameField)
        nameField.snp.makeConstraints { (make) in
            make.top.equalTo(phoneField.snp.bottom).offset(30)
            make.height.left.right.equalTo(phoneField)
        }
    }
    
    func prepareSexField() {
        sex = UILabel(frame: .zero)
        sex.text = "男"
        addSubview(sex)
        sex.snp.makeConstraints { (make) in
            make.top.equalTo(nameField.snp.bottom).offset(30)
            make.left.equalTo(nameField)
            make.width.equalTo(100)
        }

        sexControl = Switch(state: .on,  size: .small)
        sexControl.delegate = delegate
        addSubview(sexControl)
        sexControl.snp.makeConstraints { (make) in
            make.centerY.equalTo(sex)
            make.right.equalTo(nameField)
        }
        
    }
    
    func prepareAgeField() {
        ageField                          = ErrorTextField()
        ageField.placeholder              = "年龄"
        ageField.isClearIconButtonEnabled = true
        ageField.delegate                 = delegate
        ageField.dividerActiveColor       = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        ageField.leftViewActiveColor      = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        ageField.placeholderActiveColor   = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        
        let leftView                        = UIImageView()
        leftView.image                      = Icon.pen
        ageField.leftView                 = leftView
        
        addSubview(ageField)
        ageField.snp.makeConstraints { (make) in
            make.top.equalTo(sex.snp.bottom).offset(30)
            make.height.left.right.equalTo(phoneField)
        }
    }
    
    func preparePasswordField() {
        passwordField                                 = TextField()
        passwordField.placeholder                     = "密码"
        passwordField.clearButtonMode                 = .whileEditing
        passwordField.isVisibilityIconButtonEnabled   = true
        let leftView                                  = UIImageView()
        leftView.image                                = Icon.work
        passwordField.leftView                        = leftView
        passwordField.visibilityIconButton?.tintColor = Color.green.base.withAlphaComponent(passwordField.isSecureTextEntry ? 0.38 : 0.54)
        passwordField.dividerActiveColor              = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        passwordField.leftViewActiveColor             = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        passwordField.placeholderActiveColor          = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        addSubview(passwordField)
        passwordField.snp.makeConstraints { (make) in
            make.top.equalTo(ageField.snp.bottom).offset(30)
            make.left.right.height.equalTo(phoneField)
        }
    }
    
    func prepareComentsField() {
        comentsField                          = ErrorTextField()
        comentsField.placeholder              = "备注"
        comentsField.isClearIconButtonEnabled = true
        comentsField.delegate                 = delegate
        comentsField.dividerActiveColor       = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        comentsField.leftViewActiveColor      = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        comentsField.placeholderActiveColor   = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        let leftView                                  = UIImageView()
        leftView.image                                = Icon.pen
        comentsField.leftView                        = leftView
        addSubview(comentsField)
        comentsField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordField.snp.bottom).offset(30)
            make.left.right.height.equalTo(phoneField)
        }
    }
    
    func preparConfirmBtn() {
        let loginBtn             = RaisedButton(title: "注册", titleColor: UIColor.white)
        loginBtn.backgroundColor = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        loginBtn.titleColor      = UIColor.white
        loginBtn.addTarget(delegate, action: #selector(delegate?.handleRigister(button:)), for: .touchUpInside)
        addSubview(loginBtn)
        
        loginBtn.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(phoneField)
            make.top.equalTo(comentsField.snp.bottom).offset(50)
        }
    }
}
