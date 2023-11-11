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
    
    let height: Int
    let weight: Int
    var bmiValue: Float
    let colors = [UIColor.red, UIColor.green, ]
    
    init(h: Int, w: Int, bmiV: Float) {
        self.height = h
        self.weight = w
        self.bmiValue = bmiV
    }
}
