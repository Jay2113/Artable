//
//  RegisterVC.swift
//  Artable
//
//  Created by Jay Raval on 4/22/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    // Outlets
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passwordCheckImage: UIImageView!
    @IBOutlet weak var confirmPasswordCheckImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        confirmPasswordText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        guard let password = passwordText.text else { return }
        
        // If we have started typing in the confirm password text field
        if textField == confirmPasswordText {
            passwordCheckImage.isHidden = false
            confirmPasswordCheckImage.isHidden = false
        } else {
            if password.isEmpty {
                passwordCheckImage.isHidden = true
                confirmPasswordCheckImage.isHidden = true
                confirmPasswordText.text = ""
            }
        }
        
        // Make it so when the passwords match, the checkmarks turn green.
        if passwordText.text == confirmPasswordText.text {
           passwordCheckImage.image = UIImage(named: AppImages.GreenCheck)
           confirmPasswordCheckImage.image = UIImage(named: AppImages.GreenCheck)
        } else {
            passwordCheckImage.image = UIImage(named: AppImages.RedCheck)
            confirmPasswordCheckImage.image = UIImage(named: AppImages.RedCheck)
        }
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        guard let email = emailText.text, email.isNotEmpty,
            let password = passwordText.text, password.isNotEmpty,
            let username = usernameText.text, username.isNotEmpty else { return }
        
        activityIndicator.startAnimating()
        
        guard let authUser = Auth.auth().currentUser else { return }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        authUser.linkAndRetrieveData(with: credential) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }
}
