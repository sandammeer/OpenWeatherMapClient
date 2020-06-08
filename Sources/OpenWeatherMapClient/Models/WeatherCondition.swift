//
//  WeatherCondition.swift
//  
//
//  Created by Sandro Wehrhahn on 08.06.20.
//


import Foundation


public extension OpenWeatherMapClient {

    enum WeatherCondition: String, Codable {

        case clear
        case sunWithClouds
        case fewClouds
        case scatteredClouds
        case brokenClouds
        case rain
        case showerRain
        case thunderstorm
        case snow
        case wind
        case mist

    }

}
