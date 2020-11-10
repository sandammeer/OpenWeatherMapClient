//
//  OpenWeatherMapClient.swift
//
//
//  Created by Sandro Wehrhahn on 01.03.20.
//


@_exported import NIO
import AsyncHTTPClient
import Foundation


public class OpenWeatherMapClient {
    
    internal let client = HTTPClient(eventLoopGroupProvider: .shared(MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)))
    
    public var unit: Unit = .fahrenheit
    
    public var language: Language = .automatic {
        didSet {
            switch language {
            case .automatic:
                languageCode = automaticLanguageCode()
            default:
                languageCode = language.rawValue
            }
        }
    }
    
    internal var languageCode: String = "en"
    
    internal let apiKey: String
    
    internal var baseURL = "https://api.openweathermap.org/data/2.5"
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    deinit {
        try? client.syncShutdown()
    }
    
}


extension OpenWeatherMapClient {
    
    public enum Language: String {
        case automatic
        
        case af // Afrikaans
        case al // Albanian
        case ar // Arabic
        case az // Azerbaijani
        case bg // Bulgarian
        case ca // Catalan
        case cz // Czech
        case da // Danish
        case de // German
        case el // Greek
        case en // English
        case eu // Basque
        case fa // Persian (Farsi)
        case fi // Finnish
        case fr // French
        case gl // Galician
        case he // Hebrew
        case hi // Hindi
        case hr // Croatian
        case hu // Hungarian
        case id // Indonesian
        case it // Italian
        case ja // Japanese
        case kr // Korean
        case la // Latvian
        case lt // Lithuanian
        case mk // Macedonian
        case no // Norwegian
        case nl // Dutch
        case pl // Polish
        case pt // Portuguese
        case pt_br // Português Brasil
        case ro // Romanian
        case ru // Russian
        case sv // Swedish
        case sk // Slovak
        case sl // Slovenian
        case es // Spanish
        case sr // Serbian
        case th // Thai
        case tr // Turkish
        case ua// Ukrainian
        case vi // Vietnamese
        case zh_cn // Chinese Simplified
        case zh_tw // Chinese Traditional
        case zu // Zulu

    }
    
    private func automaticLanguageCode() -> String {
        guard
            let locale = Locale.current.languageCode,
            let code = locale.split(separator: "_").first
        else { return "en" }

        return String(code)
    }
}
