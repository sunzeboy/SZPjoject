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
    var timeoutInterval: TimeInterval {
        return object(forInfoDictionaryKey: "timeoutInterval") as? TimeInterval ?? 0
    }
    var applicationAPI: Dictionary<String, String> {
        return object(forInfoDictionaryKey: "ApplicationAPI") as! Dictionary<String, String>
    }
    var apiLogin: String {
        return applicationAPI["login"] ?? ""
    }
    
}
