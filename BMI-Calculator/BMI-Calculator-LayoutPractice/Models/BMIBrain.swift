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
    
    var heightBrain: Float = 0 // Рост
    var weightBrain: Float = 0 // Вес
    
    func getBMI(height: Float, weight: Float) -> Float {
        var bmi: Float = 0.0
        bmi = weight / (height * height)
        return bmi
    }
}
