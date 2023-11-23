//
//  Weather.swift
//  Clima
//
//  Created by Nikita on 22.11.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let weather: [Weather]
    let main: Main
}

struct Weather: Decodable {
    let description: String
}

struct Main: Decodable {
    let temp: Double
}
