//
//  WeatherInformation.swift
//  
//
//  Created by Sandro Wehrhahn on 01.03.20.
//


import Foundation


public extension OpenWeatherMapClient {
    
    struct WeatherInformation: Codable {
        
        public let temperature: Temperature
        public let feelsLike: Temperature
        public let temperatureMin: Temperature
        public let temperatureMax: Temperature
        public let pressure: Int
        public let humidity: Int
        
        enum CodingKeys: String, CodingKey {
            
            case temperature = "temp"
            case feelsLike = "feels_like"
            case temperatureMin = "temp_min"
            case temperatureMax = "temp_max"
            case pressure
            case humidity
            
        }
        
    }
    
}
