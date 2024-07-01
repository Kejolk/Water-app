//
//  Water_appApp.swift
//  Water app
//
//  Created by Steven Gonzalez on 5/31/24.
//

import UIKit
import SwiftUI
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Request authorization to send notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in
            // Handle authorization request completion
        }
        
        return true
    }
}

@main
struct Water_appApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
        
        var body: some Scene {
            WindowGroup {
                ContentView()
            }
        }
    }
