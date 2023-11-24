//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    //MARK: - Properties
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    

    //MARK: - IB Outlet's
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK: - Lifecylce
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate
        searchTextField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
    
        // Call function's
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    
    }

    //MARK: - IB Action's
    
    @IBAction func findButton(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    
    @IBAction func locationButton(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
}

    //MARK: - Extension

extension WeatherViewController: UITextFieldDelegate {
    
    //MARK: Text field delegate methods
      
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let city = searchTextField.text else { return }
        weatherManager.getCityName(city: city)
        searchTextField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {             
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
}

extension WeatherViewController: WeatherDelegate {
    
    //MARK: Weather delegate methods
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.city
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.imageName)
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

extension WeatherViewController: CLLocationManagerDelegate {
    
    //MARK: Core location delegate methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        locationManager.stopUpdatingLocation()
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        self.weatherManager.getCoordinate(lat: latitude, lon: longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

