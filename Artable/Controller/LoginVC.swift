//
//  LoginVC.swift
//  Artable
//
//  Created by Jay Raval on 4/22/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        guard let email = emailText.text, email.isNotEmpty,
            let password = passwordText.text, password.isNotEmpty else {
                simpleAlert(title: "Error", message: "Please fill out all the fields.")
                return
        }
        
        activityIndicator.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            
            if let error = error {
                debugPrint(error.localizedDescription)
                self?.handleFireAuthError(error: error)
                self?.activityIndicator.stopAnimating()
                return
            }
            
            self?.activityIndicator.stopAnimating()
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func guestClicked(_ sender: Any) {
    }
}
