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
    var bmi: Float = 0.0
    
    mutating func calculateBMI(height: Float, weight: Float) {
        self.bmi = weight / (height * height)
    }
    
    func getBMI() -> String {
        let value = NSString(format: "%.0f", self.bmi)
        return String(value)
    }
}
