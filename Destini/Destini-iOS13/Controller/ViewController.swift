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
    
    let story = StoryBrain()
    let storyZeroandChoice = ["You see a fork in the road.", "Take a left", "Take a right"]
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK: - IB Action's

    @IBAction func choiceButtonPressed(_ sender: UIButton) {
    }
    
    func updateUI() {
        
        storyLabel.text = storyZeroandChoice[0]
        
    
        
        // Configure button
        choiceOne.layer.cornerRadius = 20
        choiceTwo.layer.cornerRadius = 20
        choiceOne.setTitle(storyZeroandChoice[1], for: .normal)
        choiceTwo.setTitle(storyZeroandChoice[2], for: .normal)
    }
}
