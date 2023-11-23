//
//  ApiManager.swift
//  Clima
//
//  Created by Nikita on 22.11.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

class ApiManager {
    
    //MARK: - Properties
    
    let apiKey = "67c166905641c3fbe153816326225090"
    let url = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    
    //MARK: - Methods
    
    ///Gets the URL parameter as the city name
    func getParametrs(city: String) {
        let urlString = "\(url)&appid=\(apiKey)&q=\(city)&lang=ru"
        requestWeather(url: urlString)
    }
    
    ///Launching a session to receive weather data
    func requestWeather(url: String) {
        guard let url = URL(string: url) else {
            print("url is empry")
            return
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }
            guard let data = data else { return }
            do {
                let decodeWeather = try? JSONDecoder().decode(WeatherData.self, from: data)
                if let decodeData = decodeWeather {
                    let cityName = decodeData.name
                    let temp = decodeData.main.temp
                    let weatherId = decodeData.weather[0].id
                    let currentWeather = WeatherModel(city: cityName, temp: temp, id: weatherId)
                    print(currentWeather.temperatureString)
                }
            }
        }
        task.resume()
    }
}
