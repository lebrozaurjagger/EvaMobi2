//
//  URLHandler.swift
//  Bass Spotter
//
//  Created by 1234 on 03.08.2024.
//

import Foundation
import Alamofire

struct URLHandler {
     static func checkURLStatus(url: URL, completion: @escaping (Bool, URL?, Int?) -> Void) {
        AF.request(url).response { response in
            if let statusCode = response.response?.statusCode {
                print("Status: ", statusCode)
                
                if statusCode == 200 {
                    let updatedURL = addParameters(to: url)
                    
                    completion(true, updatedURL, statusCode)
                } else {
                    completion(false, url, statusCode)
                }
            } else if let error = response.error {
                print("Error: \(error.localizedDescription)")
                
                completion(false, url, nil)
            } else {
                print("Status: No response")
                
                completion(false, url, nil)
            }
        }
    }
    
    private static func addParameters(to url: URL) -> URL {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return url
        }
        let parameters: [String: String] = ["idfa": Constants.idfa]
        let queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        if urlComponents.queryItems != nil {
            urlComponents.queryItems?.append(contentsOf: queryItems)
        } else {
            urlComponents.queryItems = queryItems
        }
        return urlComponents.url ?? url
    }
}
