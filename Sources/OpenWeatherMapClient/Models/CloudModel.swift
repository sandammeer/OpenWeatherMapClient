//
//  CloudModel.swift
//  
//
//  Created by Sandro Wehrhahn on 01.03.20.
//


import Foundation


public extension OpenWeatherMapClient {
    
    struct CloudModel: Codable {
        
        public let percent: Int
        
        enum CodingKeys: String, CodingKey {
            
            case percent = "all"
            
        }
        
    }

}
