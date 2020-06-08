//
//  WeatherModel.swift
//  
//
//  Created by Sandro Wehrhahn on 01.03.20.
//


import Foundation


public extension OpenWeatherMapClient {
    
    struct WeatherModel: Codable {
        
        public let id: Int
        public let name: String
        public let description: String
        public let iconId: String

        enum CodingKeys: String, CodingKey {
            
            case id
            case name = "main"
            case description
            case iconId = "icon"
            
        }

    }

}

// MARK: - Computed Properties

public extension OpenWeatherMapClient.WeatherModel {

    /// From: "https://openweathermap.org/weather-conditions
    var iconURL: String {
        "http://openweathermap.org/img/wn/\(iconId)@2x.png"
    }

    /// Gets the weatherCondition form the iconId
    /// Source:  https://openweathermap.org/weather-conditions
    var weatherCondition: OpenWeatherMapClient.WeatherCondition? {
        switch iconId {
        case "01d", "01n":   return .clear
        case "02d", "02n":   return .fewClouds
        case "03d", "03n":   return .scatteredClouds
        case "04d", "04n":   return .brokenClouds
        case "09d", "09n":   return .showerRain
        case "010d", "010n": return .rain
        case "011d", "011n": return .thunderstorm
        case "013d", "013n": return .snow
        case "50d", "50n":   return .mist
        default: return nil
        }
    }

}
