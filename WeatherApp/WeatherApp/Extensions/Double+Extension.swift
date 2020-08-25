//
//  DoubleExtension.swift
//  WeatherApp
//
//  Created by Pick Jobs on 8/22/20.
//  Copyright © 2020 Pick Jobs. All rights reserved.
//

import Foundation

extension Double {
    
    var toCelsius: String {
        let calculation: Double = ((self - 32)) / 1.8
        return ("\(calculation.roundToPlaces(2))")
}
    
    func roundToPlaces(_ places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
