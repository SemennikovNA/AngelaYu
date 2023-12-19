//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit



class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = " "
        
       
        // Call function's
        setupView()
    }
    
    private func setupView() {
        var charIndex: Double = 0
        let textForTitle = "⚡️ Flash chat"
        for letter in textForTitle {
            Timer.scheduledTimer(withTimeInterval: 0.1 *  charIndex, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
}
