//
//  Weather.swift
//  WeatherApp
//
//  Created by Pick Jobs on 8/9/20.
//  Copyright © 2020 Pick Jobs. All rights reserved.
//

import Foundation
import UIKit


enum Forecast {
    case sunny
    case cloudy
    case windy
    case rainy
    case snowy
    case foggy
    case thunder
    case clear
    
    var image: UIImage{
        switch self {
        case .sunny:
            return UIImage(named: "sunny")!
        case .cloudy:
            return UIImage(named: "cloudy")!
        case .windy:
            return UIImage(named: "windy")!
        case .rainy:
            return UIImage(named: "rainy")!
        case .snowy:
            return UIImage(named: "snowy")!
        case .foggy:
            return UIImage(named: "foggy")!
        case .thunder:
            return UIImage(named: "thunder")!
        case .clear:
            return UIImage(named: "clear")!
        }
    }
}

//Data Model
struct Weather {
    
    //var city: City
    var forecast: Forecast
    
}

//Data Parsing
//Data Parsing Model
class ApiFetch {
    
    //Unix timestamp
    var time: Int
    var summary: String
    var temperature: Double
    var icon: String
    //var timezone: String
    
    var weatherImage: UIImage? {
        switch self.icon {
        case "clear-day":
            return UIImage(named: "clear")   //this
        case "sunny":
            return UIImage(named: "sunny")
        case "partly-cloudy-day":
            return UIImage(named: "cloudy")  //this
        case "rain":
            return UIImage(named: "rainy")  //this
        case "windy":
            return UIImage(named: "windy")
        case "foggy":
            return UIImage(named: "foggy")
        case "snowy":
            return UIImage(named: "snowy")
        case "thunder":
            return UIImage(named: "thunder")
        default:
            return nil
        }
    }
    
    
    //var city: String
    init(_ dictionary: [String: Any]) {
        self.time = (dictionary["time"] as? Int) ?? 1
        self.summary = (dictionary["summary"] as? String) ?? ""
        self.temperature = (dictionary["temperature"] as? Double) ?? 1.0
        self.icon = (dictionary["icon"] as? String) ?? ""
        //self.timezone = (dictionary ["timezone"] as? String ?? "")
    }
    init() {
        self.time = 0
        self.summary = ""
        self.temperature = 0
        self.icon = ""
        //self.timezone = ""
    }
}


