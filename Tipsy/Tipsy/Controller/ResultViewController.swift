//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Nikita on 20.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - Properties
    
    
    
    //MARK: - IBOutlet's
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    //MARK: - Properties
    
    lazy var totalSum: Double = 0.0
    lazy var peopleCount = 0
    lazy var percentTip = 0
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Call function's
        setupView()
    }
    
    //MARK: - IBAction's
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    private func setupView() {
        totalLabel.text = "\(totalSum)"
        infoLabel.text = "Split between \(peopleCount) people, with \(percentTip)% tip."
    }
}
