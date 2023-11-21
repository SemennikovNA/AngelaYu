//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Nikita on 20.11.2023.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    //MARK: - IB Outlet's
    
    @IBOutlet weak var sumTextField: UITextField!
    @IBOutlet weak var zeroTipButton: UIButton!
    @IBOutlet weak var tenTipButton: UIButton!
    @IBOutlet weak var twentyTipButton: UIButton!
    @IBOutlet weak var personCountLabel: UILabel!
    
    //MARK: - Properties
    private var stepperCount = 2.0
    private var tip = 0.10
    private var finalResult = 0.0
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IB Action's
    
    @IBAction func tipChanged(_ sender: UIButton) {
        sumTextField.endEditing(true)
        
        zeroTipButton.isSelected = false
        tenTipButton.isSelected = false
        twentyTipButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    
    @IBAction func personCountStepper(_ sender: UIStepper) {
        sender.minimumValue = 2
        sender.maximumValue = 25
        stepperCount = sender.value
        self.personCountLabel.text = "\(String(format: "%.0f", stepperCount))"
    }
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        let sum = sumTextField.text
        let inputSum = Double(sum!)
        let total = Double(inputSum!) * (1 + tip)
        let totalSum = total / Double(stepperCount)
        self.finalResult = totalSum
        performSegue(withIdentifier: "result", sender: self)
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "result" else { return }
        let destVC = segue.destination as! ResultViewController
        destVC.totalSum = finalResult
        destVC.peopleCount = Int(self.stepperCount)
        destVC.percentTip = Int(tip * 100)
    }
}
