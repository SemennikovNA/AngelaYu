//
//  WeatherManager.swift
//  Clima
//
//  Created by Nikita on 22.11.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation


    //MARK: - Protocol's

protocol WeatherDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    
    //MARK: - Properties
    
    let apiKey = "67c166905641c3fbe153816326225090"
    let url = "https://api.openweathermap.org/data/2.5/weather?units=metric&lang=ru"
    var delegate: WeatherDelegate?
    
    //MARK: - Methods
    
    ///Gets the URL parameter as the city name
    func getCityName(city: String) {
        let urlString = "\(url)&appid=\(apiKey)&q=\(city)"
        requestWeather(url: urlString)
    }
    
    ///Get the URL parameter as the coordinate user
    func getCoordinate(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        let urlString = "\(url)&appid=\(apiKey)&lat=\(lat)&lon=\(lon)"
        
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
                delegate?.didFailWithError(error!)
            }
            if let safeData = data {
                if let weather = self.parseJSON(weathedData: safeData) {
                    self.delegate?.didUpdateWeather(self, weather: weather)
                }
            }
        }
        task.resume()
    }
    
    ///This function parse JSON files
    func parseJSON(weathedData: Data) -> WeatherModel? {
        
        let decode = JSONDecoder()
        do {
            let decodedData = try decode.decode(WeatherData.self, from: weathedData)
            let name = decodedData.name
            let temp = decodedData.main.temp
            let id = decodedData.weather[0].id
            
            let weather = WeatherModel(city: name, temp: temp, id: id)
            return weather
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
