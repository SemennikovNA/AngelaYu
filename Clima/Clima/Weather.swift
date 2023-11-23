//
//  Weather.swift
//  Clima
//
//  Created by Nikita on 22.11.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let name: String
    
}

struct Coord: Decodable {
    
    let lon: Double
    let lat: Double
    
}

struct Weather: Decodable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
    
}

struct Main: Decodable {
    
    let temp: Double
    
}

struct Wind: Decodable {
    
    let speed: Double
    let deg: Int
    let gust: Double
    
}
