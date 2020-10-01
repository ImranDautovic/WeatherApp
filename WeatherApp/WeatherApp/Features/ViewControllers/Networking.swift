//
//  Networking.swift
//  WeatherApp
//
//  Created by Kerim Njuhovic on 9/22/20.
//  Copyright © 2020 Pick Jobs. All rights reserved.
//

import Foundation

protocol  API {
    var baseURL: String { get }
    var endPoint: String { get }
    var httpMethod: String { get }
    var url: URL { get }
    var urlRequest: URLRequest { get }
    //var body: [String: Any] { get }
    //var header: [String: Any] { get }
}

enum WeatherNetworkService: API {
    
    case temperature
    case summary
    case time
    
    
    var baseURL: String {
        return "https://api.darksky.net/forecast"
    }
    
    var endPoint: String {
        let parent: String = "/specifications"
        
        switch self {
        case .summary:
            return parent + "/summary"
        case .temperature:
            return parent + "/temperature"
        case .time:
            return parent + "/time"
        
        return parent
        }
    }
    
    var httpMethod: String {
        return "GET"
    }
    
    var url: URL {
        return URL (string: baseURL + endPoint)!
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest (url: self.url)
        request.httpMethod = self.httpMethod
        return request
    }
    
    //var body: [String : Any] {}
    
    //var header: [String : Any] {}
    
    
}

