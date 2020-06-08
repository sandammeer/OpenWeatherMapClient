//
//  ForecastModel.swift
//  
//
//  Created by Sandro Wehrhahn on 01.03.20.
//


import Foundation


public extension OpenWeatherMapClient {
    
    struct ForecastModel: Codable {
        
        public var date: Date? {
            guard let time = time else { return nil }
            let timezoneOffset = Double(TimeZone.current.secondsFromGMT())
            return Date(timeIntervalSince1970: time + timezoneOffset)
        }
        
        public let time: TimeInterval?
        public let weather: [WeatherModel]?
        public let coordinates: WeatherCoordinates?
        public let visibility: Int?
        public let wind: WindModel?
        public let cityName: String?
        public let information: CurrentInformation?
        public let weatherInformation: WeatherInformation?

        enum CodingKeys: String, CodingKey {
            
            case time = "dt"
            case weather
            case coordinates = "coord"
            case visibility
            case wind
            case cityName = "name"
            case information = "sys"
            case weatherInformation = "main"
            
        }

    }

}
