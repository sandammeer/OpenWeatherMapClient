//
//  OpenWeatherMapClient.swift
//
//
//  Created by Sandro Wehrhahn on 01.03.20.
//


@_exported import NIO
import AsyncHTTPClient


public class OpenWeatherMapClient {
    
    internal let client = HTTPClient(
        eventLoopGroupProvider:.shared(MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount))
    )
    
    public var unit: Unit = .kelvin
    
    public var languageCode: String = "en"
    
    internal let apiKey: String
    
    internal var baseURL = "https://api.openweathermap.org/data/2.5"
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    deinit {
        try? client.syncShutdown()
    }
    
}
