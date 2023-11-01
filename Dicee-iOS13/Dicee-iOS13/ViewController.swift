//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageViewLeft: UIImageView!
    @IBOutlet weak var diceImageViewRight: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diceImageViewLeft.image = UIImage(named: "DiceSix")
        diceImageViewRight.image = UIImage(named: "DiceTwo")
    }

    @IBAction func rollButtonClick(_ sender: UIButton) {
    
        let diceImage = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
        diceImageViewLeft.image = diceImage.randomElement()
        diceImageViewRight.image = diceImage[Int.random(in: 0...5)]
    }
    
}

