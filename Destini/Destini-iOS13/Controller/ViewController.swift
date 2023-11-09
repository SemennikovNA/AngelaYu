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
    @IBOutlet var choiceButtons: [UIButton]!
    
    //MARK: - Properties
    
    var storyBrain = StoryBrain()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK: - IB Action's

    @IBAction func choiceButtonTapped(_ sender: UIButton) {
        guard let but = sender.currentTitle else { return }
        storyBrain.nextStory(userChoice: but)
        updateUI()
    }
    
    //MARK: - Methods
    
    func updateUI() {
        // Configure button
        choiceButtons.forEach { but in
            but.layer.cornerRadius = 20
            but.setTitle(storyBrain.setTitles()[but.tag], for: .normal)
//            if storyBrain.choiceNumber == 0 {
//                but.isHidden = true
//            }
        }
        storyLabel.text = storyBrain.setLabel()
        
    }
}

