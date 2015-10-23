//
//  SessionManager.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/22/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import Foundation

final class SessionManager {
    static let sharedInstance = SessionManager()
    
    private(set) var key: String
    private(set) var loggedIn: Bool
    
    private let usernameKey = "KHkUsernameKey"
    
    init() {
        key = ""
        loggedIn = false
    }
    
    private func _restoreSession() -> Bool {
        return false
    }
    
    func login(username: String, key: String) {
        self.key = key
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(username, forKey: usernameKey)
        userDefaults.synchronize()
    }
}