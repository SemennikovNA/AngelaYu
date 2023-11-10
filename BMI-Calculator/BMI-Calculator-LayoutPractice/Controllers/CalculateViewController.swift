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
    
    //MARK: - Properties
    
    var bmiInt = 0
    
    //MARK: - Life cylce
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Private methods
    
    private func updateUI() {
        self.bmiLabel.text = String(bmiInt)
    }
    
    //MARK: - IBAction's
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
