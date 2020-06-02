// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "open-weather-map-client",
    products: [
        .library(
            name: "OpenWeatherMapClient",
            targets: ["OpenWeatherMapClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "OpenWeatherMapClient",
            dependencies: ["AsyncHTTPClient"]),
        .testTarget(
            name: "OpenWeatherMapClientTests",
            dependencies: ["OpenWeatherMapClient"]),
    ]
)
