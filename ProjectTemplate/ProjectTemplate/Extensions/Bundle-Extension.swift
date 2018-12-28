//
//  Bundle-Extension.swift
//  ProjectTemplate
//
//  Created by !>-<! on 2018/12/28.
//  Copyright © 2018 !>-<!. All rights reserved.
//

import Foundation
extension Bundle {
    var apiBaseURL: String {
        return object(forInfoDictionaryKey: "serverBaseURL") as? String ?? ""
    }
}
