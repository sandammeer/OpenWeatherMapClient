//
//  Client+WeekForecast.swift
//  
//
//  Created by Sandro Wehrhahn on 02.03.20.
//


import NIO
import Foundation


public extension OpenWeatherMapClient {
    
    func weekForecastFor(cityName: String,
                         state: String? = nil,
                         countryCode: String? = nil) -> EventLoopFuture<[ForecastModel]> {
        
        let location = [cityName, state, countryCode].compactMap { $0 }.joined(separator: ",")
        let query = Query(parameters: ["q": location,
                                       "appid": apiKey,
                                       "units": unit.rawValue,
                                       "lang": languageCode])
    
        let path = "/forecast?\(query.string)"
        
        return client.get(url: baseURL + path).flatMapThrowing { response -> [ForecastModel] in
            guard var body = response.body, let bytes = body.readBytes(length: body.readableBytes)
            else {
                throw OpenWeatherMapError.errorParsingBody
            }
            do {
                let forecastList = try JSONDecoder().decode(ForecastListModel.self, from: Data(bytes))
                return forecastList.forecasts
            } catch(let error) {
                print(error)
            }
            return []
        }
    }

    func getWeatherIconDataFrom(model: WeatherModel) -> Data? {
        guard let response = try? client.get(url: model.iconURL).wait(),
            var body = response.body,
            let bytes = body.readBytes(length: body.readableBytes)
        else {
            return nil
        }
        return Data(bytes)
    }

}
