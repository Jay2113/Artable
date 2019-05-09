//
//  ViewController.swift
//  ArtableAdmin
//
//  Created by Jay Raval on 4/22/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import UIKit

class AdminHomeVC: HomeVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.leftBarButtonItem?.isEnabled = false
        
        let addCategoryButton = UIBarButtonItem(title: "Add Category", style: .plain, target: self, action: #selector(addCategory))
        navigationItem.rightBarButtonItem = addCategoryButton
    }
    
    @objc func addCategory() {
        // segue to the category view
        performSegue(withIdentifier: Segues.ToAddEditCategory, sender: self)
    }
}

