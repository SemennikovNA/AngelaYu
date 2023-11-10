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
        self.brain.heightBrain = Double(sender.value)
        let height = NSString(format: "%.2f", self.brain.heightBrain)
        heightValueLabel.text = "\(height)m"
        print(self.brain.heightBrain)
        
    }
    
    @IBAction func weightSlide(_ sender: UISlider) {
        self.brain.weightBrain = Int(sender.value) 
        let weight = String(self.brain.weightBrain)
        weightValueLabel.text = "\(weight)kg"
        print(self.brain.weightBrain)
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        let lab = brain.getBMI(height: Double(self.heightSlider.value), weight: Int(self.weightSlider.value))
        let vc = CalculateViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.bmiInt = lab
        self.present(vc, animated: true)
    }
    
}
