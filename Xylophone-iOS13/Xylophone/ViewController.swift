//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let player = UserPlayer()
    @IBOutlet var buttonsArray: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in buttonsArray {
            i.layer.cornerRadius = 20
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let letter = sender.titleLabel?.text else { return }
        player.play(nameButton: letter)
    }
    
}

