//
//  WeatherCoordinates.swift
//  
//
//  Created by Sandro Wehrhahn on 01.03.20.
//


import Foundation


public extension OpenWeatherMapClient {
    
    struct WeatherCoordinates: Codable {
        
        public let latitude: Double
        public let longitude: Double
        
        enum CodingKeys: String, CodingKey {
            
            case latitude = "lat"
            case longitude = "lon"
            
        }
    }

}
