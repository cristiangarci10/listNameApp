//
//  ApiUrls.swift
//  listNameApp
//
//  Created by Cristian Garcia on 28/6/24.
//

import Foundation

struct Configuration {
    static var apiBaseURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String else {
            return "" 
        }
        return url
    }
}
