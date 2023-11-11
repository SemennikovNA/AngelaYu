//
//  BMIBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Nikita on 10.11.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct BMIBrain {
    
    // формула фактический вес делим на ваш рост (в метрах) в квадрате
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(bmiV: bmiValue, col: .blue, a: "Eat more pies!")
        } else if bmiValue > 18.5 && bmi!.bmiValue < 24.9 {
            bmi = BMI(bmiV: bmiValue, col: .green, a: "Fir as a fiddle!")
        } else if bmiValue > 24.9 {
            bmi = BMI(bmiV: bmiValue, col: .red, a: "Eat less pies! ")
        }
    }
    
    func getBMI() -> String {
        let value = NSString(format: "%.1f", bmi?.bmiValue ?? "0.0 ")
        return String(value)
    }
}
