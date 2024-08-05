//
//  AppTracking.swift
//  Bass Spotter
//
//  Created by 1234 on 03.08.2024.
//

import Foundation
import AppTrackingTransparency
import AdSupport

struct AppTracking {
    static func appTrackingResponse(completion: @escaping (ATTrackingManager.AuthorizationStatus) -> Void) {
        
        ATTrackingManager.requestTrackingAuthorization { status in
            DispatchQueue.main.async {
                completion(status)
            }
        }
    }
}
