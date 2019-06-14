//
//  SZLoginViewController.swift
//  Business
//
//  Created by !>-<! on 2019/3/4.
//  Copyright © 2019 !>-<!. All rights reserved.
//

import UIKit
import Common
import Material
import QMUIKit

public class SZLoginViewController: SZViewController<SZLoginView> ,TextFieldDelegate
{

    public override func loadView()
    {
        super.loadView()
        customView.delegate = self
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "登录"
        QMUIConsole.log("123456")
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField)
    {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool
    {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        (textField as? ErrorTextField)?.isErrorRevealed = true
        return true
    }

    @objc
    internal func handleLogin(button: UIButton)
    {
        customView.usernameField?.resignFirstResponder()
        customView.passwordField?.resignFirstResponder()
    }
    
    @objc
    internal func handleRigister(button: UIButton)
    {
        navigationController?
            .pushViewController(SZRigisterViewController(), animated: true)
    }
    
    @objc
    internal func handleForget(button: UIButton)
    {
        
    }
    
    @objc
    internal func handleVisitor(button: UIButton)
    {
        
    }
}


