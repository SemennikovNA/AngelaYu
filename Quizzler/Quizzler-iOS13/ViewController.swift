//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlet's
    
    @IBOutlet weak var questLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
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
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK: - Methods
    
    func updateUI() {
        questLabel.text = questions[questionCount].question
        
    }

    //MARK: - IBAction's
    
    @IBAction func answerButtonsPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = questions[questionCount].answer
        
        if questionCount + 1 < questions.count {
            questionCount += 1
        } else {
            questionCount = 0
        }
        updateUI()
    }
}

