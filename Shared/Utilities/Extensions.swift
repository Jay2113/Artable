//
//  Extensions.swift
//  Artable
//
//  Created by Jay Raval on 4/22/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension String {
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

extension UIViewController {
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
