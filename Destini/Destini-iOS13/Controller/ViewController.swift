//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IB Outlet's
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    
    //MARK: - Properties
    
    let storyBrain = StoryBrain()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = String(storyBrain.story[0].title)
        choiceOne.setTitle(storyBrain.story[0].choice1, for: .normal)
        choiceTwo.setTitle(storyBrain.story[0].choice2, for: .normal)
        
        updateUI()
    }
    
    //MARK: - IB Action's

    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        
        if sender.currentTitle == "Take a left" {
            storyLabel.text = storyBrain.story[1].title
            choiceOne.setTitle(storyBrain.story[1].choice1, for: .normal)
            choiceTwo.setTitle(storyBrain.story[1].choice2, for: .normal)
        } else if sender.currentTitle == "Take a right" {
            storyLabel.text = storyBrain.story[2].title
            choiceOne.setTitle(storyBrain.story[2].choice1, for: .normal)
            choiceTwo.setTitle(storyBrain.story[2].choice2, for: .normal)
        }
    }
    
    func updateUI() {
        
        // Configure button
        choiceOne.layer.cornerRadius = 20
        choiceTwo.layer.cornerRadius = 20
    }
}
