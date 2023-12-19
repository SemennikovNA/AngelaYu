//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        guard let email = emailTextfield.text, let pass = passwordTextfield.text else { return }
        Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
            if let error = error {
                print(error)
            } else {
                self.performSegue(withIdentifier: K.register, sender: self) 
            }
        }
    }
}
