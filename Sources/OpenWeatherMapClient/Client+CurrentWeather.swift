//
//  Client+CurrentWeather.swift
//  
//
//  Created by Sandro Wehrhahn on 01.03.20.
//


import NIO
import Foundation
import AsyncHTTPClient


public extension OpenWeatherMapClient {
    
    func currentForecastFor(cityName: String,
                            state: String? = nil,
                            countryCode: String? = nil) -> EventLoopFuture<ForecastModel> {
        
        let location = [cityName, state, countryCode].compactMap { $0 }.joined(separator: ",")
        let query = Query(parameters: ["q": location,
                                       "appid": apiKey,
                                       "units": unit.rawValue,
                                       "lang": languageCode])
        
        let path = "/weather?\(query.string)"
        
        return client.get(url: baseURL + path).flatMapThrowing { response -> ForecastModel in
            guard var body = response.body, let bytes = body.readBytes(length: body.readableBytes)
            else {
                throw OpenWeatherMapError.errorParsingBody
            }
            do {
                var forecast = try JSONDecoder().decode(ForecastModel.self, from: Data(bytes))
                return forecast
            } catch let error {
                print(error)
                throw OpenWeatherMapError.errorParsingBody
            }
        }
    }
    
}
