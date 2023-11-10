//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: - IBOutlet's
    
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    
    //MARK: - Properties
    
    let brain = BMIBrain()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - IBAction's
    
    @IBAction func heightsSlide(_ sender: UISlider) {
        let height = NSString(format: "%.2f", sender.value)
        heightValueLabel.text = "\(height)m"
    }
    
    @IBAction func weightSlide(_ sender: UISlider) {
        let weight = NSString(format: "%.2f", sender.value)
        weightValueLabel.text = "\(weight)kg"
    }
    
}
