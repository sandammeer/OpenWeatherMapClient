//
//  WeatherModel.swift
//  
//
//  Created by Sandro Wehrhahn on 01.03.20.
//


import Foundation


public struct WeatherModel: Codable {
    
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
