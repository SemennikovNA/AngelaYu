//
//  Quest.swift
//  Quizzler-iOS13
//
//  Created by Nikita on 03.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation


struct Quest {
    
    let question: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], ca: String) {
        self.question = q
        self.answers = a
        self.correctAnswer = ca
    }
}
