//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: - Properties
    
    var apiManager = ApiManager()
    var weatherManage: WeatherModel?

    //MARK: - IB Outlet's
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK: - Lifecylce
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        
        //Call function's
        DispatchQueue.main.async {
            self.setupUI()
        }
    }
    
    //MARK: - Private methods
    
    private func setupUI() {
        guard let image = weatherManage?.imageName else { return }
        guard let name = weatherManage?.city else { return }
        guard let temp = weatherManage?.temperatureString else { return }
        conditionImageView.image = UIImage(named: image)
        temperatureLabel.text = temp
        cityLabel.text = name
    }
    
    //MARK: - IB Action's
    
    @IBAction func findButton(_ sender: UIButton) {
        searchTextField.endEditing(true)
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
        apiManager.getParametrs(city: city)
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
