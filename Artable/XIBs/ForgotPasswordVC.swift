//
//  ForgotPasswordVC.swift
//  Artable
//
//  Created by Jay Raval on 4/25/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var emailText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetClicked(_ sender: Any) {
        guard let email = emailText.text, email.isNotEmpty else {
            simpleAlert(title: "Error", message: "Please enter email.")
            return
        }
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                debugPrint(error)
                Auth.auth().handleFireAuthError(error: error, vc: self)
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
}
