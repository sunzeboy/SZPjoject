//
//  SZViewController.swift
//  ProjectTemplate
//
//  Created by !>-<! on 2018/12/29.
//  Copyright © 2018 !>-<!. All rights reserved.
//

import UIKit

class SZViewController<CustomView: UIView>: UIViewController {

    var customView: CustomView {
        return view as! CustomView
    }
    
    override func loadView() {
        view = CustomView()
    }
    

}
