//
//  Observable.swift
//  ProjectTemplate
//
//  Created by !>-<! on 2018/12/28.
//  Copyright © 2018 !>-<!. All rights reserved.
//

import Foundation

open class Observable<T> {
    typealias Observer = (T)->Void
    var observer: Observer?
    var value: T {
        didSet {
            observer?(value)
        }
    }
    init(_ value: T) {
        self.value = value
    }
    func observe(_ observer: Observer?) {
        self.observer = observer
        observer?(value)
    }
    
}
