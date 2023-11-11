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
    
    //MARK: -
    
    var bmi: BMI?
    
    //MARK: - Methods
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(bmiV: bmiValue, col: .cyan, a: "Eat more pies!")
        } else if bmiValue < 24.9 {
            bmi = BMI(bmiV: bmiValue, col: .systemGreen, a: "Fir as a fiddle!")
        } else if bmiValue > 24.9 {
            bmi = BMI(bmiV: bmiValue, col: .systemRed, a: "Eat less pies! ")
        }
    }
    
    func getBMI() -> String {
        let value = NSString(format: "%.1f", bmi?.bmiValue ?? "0.0 ")
        return String(value)
    }
    
    func getAdvice() -> String {
        if let textTitle = bmi?.advice {
            return textTitle
        } else {
            return "nil"
        }
    }
    
    func getColor() -> UIColor {
        if let colors = bmi?.colors {
            return colors
        } else {
            return .black
        }
    }
}
