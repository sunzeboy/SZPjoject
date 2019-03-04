//
//  SZRigisterViewController.swift
//  Business
//
//  Created by !>-<! on 2019/3/4.
//  Copyright © 2019 !>-<!. All rights reserved.
//

import UIKit
import Common
import Material

public class SZRigisterViewController: SZViewController<SZRigisterView>, TextFieldDelegate, SwitchDelegate {
    
    

    public override func loadView()
    {
        super.loadView()
        customView.delegate = self
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()

        title = "注册"

    }
    

    @objc
    internal func handleRigister(button: UIButton)
    {
        
    }
    
    /// TextFieldDelegate
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

    
    /// SwitchDelegate
    public func switchDidChangeState(control: Switch, state: SwitchState)
    {
        if state == .on
        {
            customView.sex.text = "男"
        }
        else
        {
            customView.sex.text = "女"
        }
    }
}

