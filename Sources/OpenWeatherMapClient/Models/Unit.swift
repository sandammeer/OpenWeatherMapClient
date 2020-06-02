//
//  Unit.swift
//  
//
//  Created by Sandro Wehrhahn on 04.03.20.
//


import Foundation


public extension OpenWeatherMapClient {
    
    enum Unit: String {
        
        case kelvin     = "kelvin"
        case fahrenheit = "imperial"
        case celsius    = "metric"
        
    }

}
