//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailTextfield.text, let pass = passwordTextfield.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: pass) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            self!.performSegue(withIdentifier: "login", sender: self)
        }
    }
}
