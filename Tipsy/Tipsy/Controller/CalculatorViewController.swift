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
    private var stepperCount = 2.0
    private var tipDecimal = 0.10
    private var finalResult = 0.0
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - IBAction's
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroTipButton.isSelected = false
        tenTipButton.isSelected = false
        twentyTipButton.isSelected = false
        sender.isSelected = true
        
        let title = sender.currentTitle
        let butNumber = title?.dropLast()
        guard let butTip = Double(butNumber!) else { return }
        self.tipDecimal = butTip / 100
    }
    
    
    @IBAction func personCountStepper(_ sender: UIStepper) {
        sender.minimumValue = 2
        sender.maximumValue = 25
        stepperCount = sender.value
        self.personCountLabel.text = "\(String(format: "%.0f", stepperCount))"
    }
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        performSegue(withIdentifier: "result", sender: self)
    }
    
    //MARK: - Private func
    
    private func calculate() -> Double {
        let sum = sumTextField.text
        let inputSum = Double(sum!)
        let total = Double(inputSum!) * (1 + tipDecimal)
        let totalSum = total / Double(stepperCount)
        self.finalResult = totalSum
        return finalResult
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "result" else { return }
        let destinationVC = segue.destination as! ResultViewController
        
        destinationVC.totalSum = finalResult
//        destinationVC.tip = Int(tip * 100)
//        destinationVC.split = numberOfPeople
    }
    
}

