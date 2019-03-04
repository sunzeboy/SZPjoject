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


public class SZLoginViewController: SZViewController<SZLoginView> ,TextFieldDelegate
{

    public override func loadView() {
        let loginView = SZLoginView()
        loginView.delegate = self
        view = loginView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = true
        return true
    }

}


