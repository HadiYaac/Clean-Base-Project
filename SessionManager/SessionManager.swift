//
//  SessionManager.swift
//  SessionManager
//
//  Created by Wassim on 6/11/18.
//  Copyright © 2018 Tedmob. All rights reserved.
//

import Foundation

public class SummerAppSessionManager {
    
    public init(){
        
    }
    public static let shared = SummerAppSessionManager()
    
    public var token : String? {
        get {
            guard let sid = UserDefaults.standard.string(forKey: SessionManagerConstants.UserDefaultKeys.sessionIdKey) else {
                return nil
            }
            return sid
        }set {
            print("Session Manager ===> Setting new session id to \(newValue)")
            UserDefaults.standard.set(newValue, forKey: SessionManagerConstants.UserDefaultKeys.sessionIdKey)
            UserDefaults.standard.synchronize()
            
        }
    }
    
    public var currentUserName : String? {
        get {
            guard let sid = UserDefaults.standard.string(forKey: SessionManagerConstants.UserDefaultKeys.usernameKey) else {
                return nil
            }
            return sid
        }set {
            print("Session Manager ===> Setting new usename to \(newValue)")
            
            UserDefaults.standard.set(newValue, forKey: SessionManagerConstants.UserDefaultKeys.usernameKey)
            
        }
    }
    
    
    public var currentUserPassword : String? {
        get {
            guard let sid = UserDefaults.standard.string(forKey: SessionManagerConstants.UserDefaultKeys.passwordKey) else {
                return nil
            }
            return sid
        }set {
            print("Session Manager ===> Setting new password  to \(newValue)")
            
            UserDefaults.standard.set(newValue, forKey: SessionManagerConstants.UserDefaultKeys.passwordKey)
            
        }
    }
    public var userIsLoggedIn : Bool! {
        return  self.token != nil
    }
    
    public var isInExploreMode : Bool = false
    
}