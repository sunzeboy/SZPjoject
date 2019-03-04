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

    fileprivate var usernameField: ErrorTextField!
    fileprivate var passwordField: TextField!
    fileprivate let constant: CGFloat = 50
    var delegate: UIViewController?
    
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
 
    /// Prepares the resign responder button.
    fileprivate func prepareResignResponderButton() {
        let btn = RaisedButton(title: "登录", titleColor: Color.blue.base)
        btn.backgroundColor = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        btn.titleColor = UIColor.white
        btn.addTarget(self, action: #selector(handleResignResponderButton(button:)), for: .touchUpInside)
        addSubview(btn)
        
        btn.snp.makeConstraints { (make) in
            make.left.right.equalTo(usernameField)
            make.top.equalTo(passwordField.snp.bottom).offset(70)
            make.height.equalTo(constant)
        }
        
//        let r = <#value#>
        
    }
    
    /// Handle the resign responder button.
    @objc
    internal func handleResignResponderButton(button: UIButton) {
        usernameField?.resignFirstResponder()
        passwordField?.resignFirstResponder()
    }
    
    fileprivate func prepareUsernameField() {
        usernameField = ErrorTextField()
        usernameField.placeholder = "手机号"
//        usernameField.detail = "无效的手机号"
        usernameField.isClearIconButtonEnabled = true
        usernameField.delegate = (delegate as! TextFieldDelegate)
        usernameField.dividerActiveColor = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        usernameField.leftViewActiveColor = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        usernameField.placeholderActiveColor = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
//        usernameField.isPlaceholderUppercasedWhenEditing = true
//        usernameField.placeholderAnimation = .hidden
        
        
        let leftView = UIImageView()
        leftView.image = Icon.phone
        usernameField.leftView = leftView
        
        addSubview(usernameField)
        usernameField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }
    
    fileprivate func preparePasswordField() {
        passwordField = TextField()
        passwordField.placeholder = "密码"
//        passwordField.detail = "至少"
        passwordField.clearButtonMode = .whileEditing
        passwordField.isVisibilityIconButtonEnabled = true
        let leftView = UIImageView()
        leftView.image = Icon.work
        passwordField.leftView = leftView
        // Setting the visibilityIconButton color.
        passwordField.visibilityIconButton?.tintColor = Color.green.base.withAlphaComponent(passwordField.isSecureTextEntry ? 0.38 : 0.54)
        passwordField.dividerActiveColor = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        passwordField.leftViewActiveColor = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        passwordField.placeholderActiveColor = UIColor.init(red: 20/255.0, green: 151/255.0, blue: 122/255.0, alpha: 1.0)
        addSubview(passwordField)
        passwordField.snp.makeConstraints { (make) in
            make.top.equalTo(self.usernameField.snp.bottom).offset(50)
            make.left.right.height.equalTo(self.usernameField)
        }
    }
    
}
