//
//  CalculateViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Nikita on 10.11.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    //MARK: - IBOutlet's
    
    @IBOutlet weak var bmiLabel: UILabel! 
    @IBOutlet weak var recomendLabel: UILabel!
    
    //MARK: - Properties
    
    var bmiInt: String?
    var advice: String?
    var colors: UIColor?
    
    //MARK: - Life cylce
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK: - Private methods
    
    private func updateUI() {
        
        self.view.backgroundColor = colors
        self.recomendLabel.text = advice
        self.bmiLabel.text = bmiInt
    }
    
    //MARK: - IBAction's
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
