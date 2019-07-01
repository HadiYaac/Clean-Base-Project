//
//  AppDelegate.swift
//  Base-Project
//
//  Created by Wassim Seifeddine on 12/4/17.
//  Copyright © 2017 Tedmob. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications
import SessionRepository
import RxSwift
import Logging

var logger = Logger(label: "Base-Project-Logger")

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var oneSignalAppId : String = ""
    var sessionExpiryRelaySubscription: Disposable?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        logger.info("Base Project Version 3.0")
        
        if !self.oneSignalAppId.isEmpty {
            initOneSignal(withLaunchOption: launchOptions, andOneSignalId: oneSignalAppId)
        }else {
            logger.warning("Will not init OneSignal. App ID is empty")
        }
        
        subscribeToSessionExpiryRelay()

        
        return true
    }
}

