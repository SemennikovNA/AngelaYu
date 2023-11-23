//
//  WeatherModel.swift
//  Clima
//
//  Created by Nikita on 23.11.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let city: String
    let temp: Double
    let id: Int
    
    var temperatureString: String {
        return String(format: "%.1f", temp)
    }
    
    var imageName: String {
        switch id {
        case 200...232:
            return "cloud.bolt.fill"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.sleet.fill"
        case 701...781:
            return "smoke"
        case 800:
            return "sun.max.fill"
        case 801...805:
            return "cloud.fill"
        default:
            return "cloud"
        }
    }
    
}
