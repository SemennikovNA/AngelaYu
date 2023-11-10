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
    
    var heightBrain: Double = 0 // Рост
    var weightBrain: Int = 0 // Вес
    
    func getBMI(height: Double, weight: Int) -> Int {
        var bmi: Int = 0
        bmi = weight / Int((height * height))
        return bmi 
    }
}
