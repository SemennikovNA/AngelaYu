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
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    //MARK: - Properties
    
    var brain = BMIBrain()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - IBAction's
    
    @IBAction func heightsSlide(_ sender: UISlider) {
        self.brain.heightBrain = sender.value
        let height = NSString(format: "%.2f", self.brain.heightBrain)
        heightValueLabel.text = "\(height)m"
        print(self.brain.heightBrain)
        
    }
    
    @IBAction func weightSlide(_ sender: UISlider) {
        self.brain.weightBrain = sender.value
        let weight = NSString(format: "%.2f", self.brain.weightBrain)
        weightValueLabel.text = "\(weight)kg"
        print(self.brain.weightBrain)
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        let vc = CalculateViewController()
        let calcul = brain.getBMI(height: self.brain.heightBrain, weight: self.brain.weightBrain)
        guard let cal = calcul as? Float else { return }
        vc.bmiLabel.text? = String(cal)
        present(vc, animated: true)
    }
    
}
