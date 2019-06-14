//
//  SZViewController.swift
//  ProjectTemplate
//
//  Created by !>-<! on 2018/12/29.
//  Copyright © 2018 !>-<!. All rights reserved.
//

import UIKit


open class SZViewController<CustomView: UIView>: UIViewController {

    public var customView: CustomView {
        return view as! CustomView
    }
    
    override open func loadView() {
        view = CustomView()
    }
    

}
