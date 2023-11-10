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
        let height = NSString(format: "%.2f", sender.value)
        heightValueLabel.text = "\(height)m"
        print(height)
        
    }
    
    @IBAction func weightSlide(_ sender: UISlider) {
        let weight = NSString(format: "%.0f", sender.value)
        weightValueLabel.text = "\(weight)kg"
        print(weight)
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goResult" else { return }
        let destiniVC = segue.destination as! CalculateViewController
        destiniVC.bmiInt = String(brain.getBMI(height: Double(heightSlider.value), weight: Int(weightSlider.value)))
        self.present(destiniVC, animated: true)
        
    }
    
}
