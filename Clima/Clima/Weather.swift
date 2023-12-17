//
//  Weather.swift
//  Clima
//
//  Created by Nikita on 22.11.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let name: String
    
}

struct Coord: Codable {
    
    let lon: Double
    let lat: Double
    
}

struct Weather: Codable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
    
}

struct Main: Codable {
    
    let temp: Double
    
}
