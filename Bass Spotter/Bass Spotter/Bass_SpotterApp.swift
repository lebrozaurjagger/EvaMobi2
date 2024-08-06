//
//  Bass_SpotterApp.swift
//  Bass Spotter
//
//  Created by Phillip on 29.07.2024.
//

import SwiftUI
import OneSignalFramework

@main
struct Bass_SpotterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        OneSignal.initialize(Constants.onesignalKey, withLaunchOptions: launchOptions)
        
        return true
    }
}
