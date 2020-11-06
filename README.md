# OpenWeatherMapClient

[Swift Version](https://img.shields.io/badge/Swift-5.1.2-orange.svg)
![PackageManager](https://img.shields.io/badge/PackageManager-SPM-brightgreen.svg?style=flat)
![Platforms](https://img.shields.io/badge/Platforms-iOS-yellow.svg?style=flat)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/sandammeer/OpenWeatherMapClient/blob/master/LICENSE)

## Description

Basic Client for [OpenWeatherMap Api](https://openweathermap.org/api) written in Swift 5 based on [AsyncHttpClient](https://github.com/swift-server/async-http-client)

## Usage

Create client with apikey and **settings**

```
let client = OpenWeatherMapClient(apiKey: "your_api_key)
client.unit = .celsius
client.languageCode = "de"

```

#### Settings 

**Units:**

* Fahrenheit (default)
* Celsius
* Kelvin 

**Languages:**

Default is english (**en**)

Language Codes can be found [here](https://openweathermap.org/current#multi)

## Testing

Add **apiKey** as environment variable in Xcode.



## Need Help?

Please [submit an issue](https://github.com/sandammeer/OpenWeatherMapClient/issues) on GitHub.

## License

This project is licensed under the terms of the MIT license. See the [LICENSE](LICENSE) file.
