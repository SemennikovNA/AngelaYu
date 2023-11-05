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
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //MARK: - Properties
    var brain = Brain()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        updateUI()
    }
    
    //MARK: - Methods
    
    func updateUI() {
        self.questLabel.text = brain.getQuestText()
        self.progressBar.progress = brain.getProgress()
        self.scoreLabel.text = "Score: \(brain.getScore()) "
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.trueButton.backgroundColor = .clear
            self.falseButton.backgroundColor = .clear
        }
    }

    //MARK: - IBAction's
    
    @IBAction func answerButtonsPressed(_ sender: UIButton) {
        
        guard let answer = sender.currentTitle else { return }
        let userAnswer = brain.checkAnswer(answer: answer)
        
        if userAnswer == true {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        brain.nextQuest()
        updateUI()
    }
}

