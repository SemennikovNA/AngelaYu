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
    var score = 0
    let questions = [
        Quest(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], ca: "Skin"),
        Quest(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], ca: "100"),
        Quest(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], ca: "Greenwich Mean Time"),
        Quest(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], ca: "Chapeau"),
        Quest(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], ca: "Watch"),
        Quest(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], ca: "Adiós"),
        Quest(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], ca: "Orange"),
        Quest(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], ca: "Rum"),
        Quest(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], ca: "Gorilla"),
        Quest(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], ca: "Australia")
    ]
    
    //MARK: - Methods
    
    mutating func checkAnswer(answer userAnswer: String) -> Bool {
        
        if userAnswer == questions[questionCount].correctAnswer {
            self.score += 1
            return true
        } else {
            return false
        }
}
    
    func getQuestText() -> String {
        
        let text: String = questions[questionCount].question
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
            self.score = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    func setTitle() -> [String] {
        var butTitle = [String]()
        butTitle = questions[self.questionCount].answers
        return butTitle
    }
}
