

import XCTest
@testable import OpenWeatherMapClient


final class OpenWeatherMapClientTests: XCTestCase {
    
    let apiKey = ProcessInfo().environment["apiKey"] ?? "Enter your APIKey as environment variable"
    
    func testGetTodaysForecast() {
        let client = OpenWeatherMapClient(apiKey: apiKey)
        
        let forecast = try? client.currentForecastFor(cityName: "Hamburg").wait()
        XCTAssertNotNil(forecast)
        
        XCTAssertEqual(forecast?.cityName, "Hamburg")
        XCTAssertEqual(forecast?.information?.country, "DE")
    }

    func testGetWeekForecast() {
        let client = OpenWeatherMapClient(apiKey: apiKey)
        client.unit = .celsius
        client.language = .en
        
        let forecasts = try? client.weekForecastFor(cityName: "Hamburg").wait()
        XCTAssertNotNil(forecasts)
        XCTAssertEqual(forecasts?.isEmpty, false)
    }

    func testGetIconData() {
        let client = OpenWeatherMapClient(apiKey: apiKey)
        let forecast = try? client.currentForecastFor(cityName: "Hamburg").wait()
        let weatherModel = forecast?.weather?.first
        XCTAssertNotNil(weatherModel)
        let iconData = client.getWeatherIconDataFrom(model: weatherModel!)
        XCTAssertNotNil(iconData)
    }

    static var allTests = [
        ("testGetTodaysForecast", testGetTodaysForecast),
        ("testGetWeekForecast", testGetWeekForecast),
        ("testGetIconData", testGetIconData)
    ]

}
