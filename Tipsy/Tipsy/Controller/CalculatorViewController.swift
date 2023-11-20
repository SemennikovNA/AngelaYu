//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: - IB Outlet's
    
    @IBOutlet weak var sumTextField: UITextField!
    @IBOutlet weak var zeroTipButton: UIButton!
    @IBOutlet weak var tenTipButton: UIButton!
    @IBOutlet weak var twentyTipButton: UIButton!
    @IBOutlet weak var personCountLabel: UILabel!
    
    //MARK: - Properties
    
    let zeroTip = 0.0
    let tenTip = 0.1
    let twentyTip = 0.2
    var stepperCount: Double = 1
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - IBAction's
    
    @IBAction func tipChanged(_ sender: UIButton) {
        switch sender.currentTitle {
        case "0%":
            zeroTipButton.isSelected = true
            tenTipButton.isSelected = false
            twentyTipButton.isSelected = false
        case "10%":
            zeroTipButton.isSelected = false
            tenTipButton.isSelected = true
            twentyTipButton.isSelected = false
        case "20%":
            zeroTipButton.isSelected = false
            tenTipButton.isSelected = false
            twentyTipButton.isSelected = true
        default:
            print("error")
        }
    }
    
    
    @IBAction func personCountStepper(_ sender: UIStepper) {
        sender.minimumValue = 1
        sender.maximumValue = 25
        stepperCount = sender.value
        self.personCountLabel.text = "\(String(format: "%.0f", stepperCount))"
    }
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        if zeroTipButton.isSelected == true {
            print(zeroTip)
        } else if tenTipButton.isSelected == true {
            print(tenTip)
        } else {
            print(twentyTip)
        }
        print(stepperCount)
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "result" else { return }
        let resultVC = ResultViewController()
        present(resultVC, animated: true)
    }
    
}

