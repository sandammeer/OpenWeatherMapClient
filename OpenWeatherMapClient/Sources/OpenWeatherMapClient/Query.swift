//
//  Query.swift
//  
//
//  Created by Sandro Wehrhahn on 04.03.20.
//

import Foundation


public class Query {
    
    public var string: String {
        parameters
            .filter { $0.value != nil }
            .map { "\($0.key)=\($0.value ?? "")" }
            .joined(separator: "&")
    }
    
    private var parameters: [String: String?]
    
    public init(parameters: [String: String?]) {
        self.parameters = parameters
    }
    
}
