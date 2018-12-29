//
//  SZView.swift
//  ProjectTemplate
//
//  Created by !>-<! on 2018/12/29.
//  Copyright © 2018 !>-<!. All rights reserved.
//

import UIKit

class SZView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
