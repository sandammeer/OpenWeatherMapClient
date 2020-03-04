//
//  ForecastListModel.swift
//  
//
//  Created by Sandro Wehrhahn on 02.03.20.
//


import Foundation


public struct ForecastListModel: Codable {
    
    public let forecasts: [ForecastModel]
    
    enum CodingKeys: String, CodingKey {
        
        case forecasts = "list"
        
    }
    
}
