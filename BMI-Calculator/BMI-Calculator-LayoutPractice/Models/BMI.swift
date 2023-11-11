//
//  BMI.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Nikita on 10.11.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct BMI {
    
    var bmiValue: Float
    var colors: UIColor
    var advice: String
    
    init(bmiV: Float, col: UIColor, a: String) {
        self.bmiValue = bmiV
        self.colors = col
        self.advice = a
    }
}
