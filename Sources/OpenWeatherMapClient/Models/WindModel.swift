//
//  WindModel.swift
//  
//
//  Created by Sandro Wehrhahn on 01.03.20.
//


import Foundation


public struct WindModel: Codable {
    
    public let speed: Double
    public let degree: Int
    
    enum CodingKeys: String, CodingKey {
        
        case speed
        case degree = "deg"
        
    }
    
}
