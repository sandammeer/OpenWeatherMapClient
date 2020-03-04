//
//  CurrentInformation.swift
//  
//
//  Created by Sandro Wehrhahn on 01.03.20.
//


import Foundation


public struct CurrentInformation: Codable {
    
    public let type: Int?
    public let country: String?
    public let sunrise: Int?
    public let sunset: Int?
    
}
