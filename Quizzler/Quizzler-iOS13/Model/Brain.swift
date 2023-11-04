//
//  Brain.swift
//  Quizzler-iOS13
//
//  Created by Nikita on 04.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Brain {
    
    //MARK: - Properties
    
    var questionCount = 0
    let questions = [
        Quest(q: "A slug's blood is green.", a: "True"),
        Quest(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Quest(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Quest(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Quest(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Quest(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Quest(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Quest(q: "Google was originally called 'Backrub'.", a: "True"),
        Quest(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Quest(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Quest(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Quest(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
        
    ]
    
    //MARK: - Methods
    
    func checkAnswer(answer userAnswer: String) -> Bool  {
        if userAnswer == questions[questionCount].answer {
            return true
        } else {
            return false
        }
    }
    
    func getQuestText() -> String {
        let  text: String = questions[questionCount].question
        return text
    }
    
    func getProgress() -> Float {
        var progress: Float = 0.0
        progress = Float(questionCount + 1) / Float(questions.count)
        return progress
    }
    
    mutating func nextQuest() {
        if questionCount + 1 < questions.count {
            self.questionCount += 1
        } else {
            self.questionCount = 0
        }
    }
}
