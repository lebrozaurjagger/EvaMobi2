//
//  OneSignalPush.swift
//  Bass Spotter
//
//  Created by 1234 on 03.08.2024.
//

import Foundation
import OneSignalFramework
import AppTrackingTransparency

struct OnesignalPush {
    
    static var launch: [UIApplication.LaunchOptionsKey: Any]?
    
    static func initPush(completion: @escaping (ATTrackingManager.AuthorizationStatus) -> Void) {
        OneSignal.initialize(
            Constants.onesignalKey,
            withLaunchOptions: launch
        )
        OneSignal.Notifications.requestPermission({ accepted in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                AppTracking.appTrackingResponse { status in
                    completion(status)
                }
            }
        }, fallbackToSettings: true)
    }
}
