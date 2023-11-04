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
    let answer: String
    
    init(q: String, a: String) {
        self.question = q
        self.answer = a
    }
}
