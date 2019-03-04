//
//  SZLoginView.swift
//  Business
//
//  Created by !>-<! on 2019/3/4.
//  Copyright © 2019 !>-<!. All rights reserved.
//

import UIKit
import Material
import SnapKit

public class SZLoginView: UIView {

    public var usernameField: ErrorTextField!
    public var passwordField: TextField!
    public var delegate: SZLoginViewController?
    
    private let loginBtnHeight: CGFloat    = 50
    private let rigisterBtnHeight: CGFloat = 20

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func draw(_ rect: CGRect) {
        // Drawing code
        prepareUsernameField()
        preparePasswordField()
        prepareResignResponderButton()
    }
 
    
    /// login rigister forget btn
    fileprivate func prepareResignResponderButton()
    {
        let loginBtn             = RaisedButton(title: "登录", titleColor: UIColor.white)
        loginBtn.backgroundColor = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        loginBtn.titleColor      = UIColor.white
        loginBtn.addTarget(delegate, action: #selector(delegate?.handleLogin(button:)), for: .touchUpInside)
        addSubview(loginBtn)
        
        loginBtn.snp.makeConstraints { (make) in
            make.left.right.equalTo(usernameField)
            make.top.equalTo(passwordField.snp.bottom).offset(70)
            make.height.equalTo(loginBtnHeight)
        }
        
        let rigisterBtn = Button(title: "注册", titleColor: UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0))
        rigisterBtn.addTarget(delegate, action: #selector(delegate?.handleRigister(button:)), for: .touchUpInside)
        addSubview(rigisterBtn)
        rigisterBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.centerX).offset(-20)
            make.top.equalTo(loginBtn.snp.bottom).offset(20)
            make.height.equalTo(rigisterBtnHeight)
            make.width.equalTo(100)
        }
        
        let forgetBtn = Button(title: "忘记密码", titleColor: UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0))
        forgetBtn.addTarget(delegate, action: #selector(delegate?.handleForget(button:)), for: .touchUpInside)
        addSubview(forgetBtn)
        forgetBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.centerX).offset(20)
            make.top.equalTo(loginBtn.snp.bottom).offset(20)
            make.height.equalTo(rigisterBtnHeight)
            make.width.equalTo(100)
        }
        
        let visitorsBtn = Button(title: "访客进入", titleColor: UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0))
        visitorsBtn.addTarget(delegate, action: #selector(delegate?.handleVisitor(button:)), for: .touchUpInside)
        addSubview(visitorsBtn)
        visitorsBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(loginBtn.snp.bottom).offset(80)
            make.height.equalTo(rigisterBtnHeight)
            make.width.equalTo(100)
        }
    }
    
    
    
    fileprivate func prepareUsernameField()
    {
        usernameField                          = ErrorTextField()
        usernameField.placeholder              = "手机号"
        usernameField.isClearIconButtonEnabled = true
        usernameField.delegate                 = delegate
        usernameField.dividerActiveColor       = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        usernameField.leftViewActiveColor      = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        usernameField.placeholderActiveColor   = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        
        let leftView                           = UIImageView()
        leftView.image                         = Icon.phone
        usernameField.leftView                 = leftView
        
        addSubview(usernameField)
        usernameField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }
    
    fileprivate func preparePasswordField()
    {
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
            make.top.equalTo(self.usernameField.snp.bottom).offset(50)
            make.left.right.height.equalTo(self.usernameField)
        }
    }
    
}
