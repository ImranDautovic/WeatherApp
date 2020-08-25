//
//  Int+Extension.swift
//  WeatherApp
//
//  Created by Pick Jobs on 8/22/20.
//  Copyright © 2020 Pick Jobs. All rights reserved.
//

import Foundation

extension Int {
    
   func getDateStringFromUTC() -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(self))

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "dd MMM YYYY"

        return dateFormatter.string(from: date)
    }
    
    
    
}
