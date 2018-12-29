//
//  CollectionDataProvider.swift
//  GenericDataSource
//
//  Created by !>-<! on 2018/12/29.
//  Copyright © 2018 !>-<!. All rights reserved.
//

import UIKit

public protocol CollectionDataProvider {
    associatedtype T
    
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> T?
    
    func updateItem(at indexPath: IndexPath, value: T)
}
