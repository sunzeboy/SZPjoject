//
//  ConfigurableCell.swift
//  GenericDataSource
//
//  Created by !>-<! on 2018/12/29.
//  Copyright © 2018 !>-<!. All rights reserved.
//

import Foundation

public protocol ConfigurableCell: ReusableCell {
    associatedtype T
    
    func configure(_ item: T, at indexPath: IndexPath)
}
