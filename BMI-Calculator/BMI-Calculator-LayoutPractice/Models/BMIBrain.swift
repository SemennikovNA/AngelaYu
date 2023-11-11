//
//  BMIBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Nikita on 10.11.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct BMIBrain {
    
    // формула фактический вес делим на ваш рост (в метрах) в квадрате
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        self.bmi?.bmiValue = weight / (height * height)
    }
    
    func getBMI() -> String {
        let value = NSString(format: "%.1f", bmi?.bmiValue ?? "0.0 ")
        return String(value)
    }
}
