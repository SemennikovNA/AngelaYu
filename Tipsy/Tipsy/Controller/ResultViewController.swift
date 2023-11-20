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
    @IBOutlet weak var settingLabel: UILabel!
    
    //MARK: - Properties
    
    var totalSum: Double = 0.0
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = "\(totalSum)"
    }
    
    //MARK: - IBAction's
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
