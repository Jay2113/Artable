//
//  ProductDetailVC.swift
//  Artable
//
//  Created by Jay Raval on 5/8/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var backgroundView: UIVisualEffectView!
    
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        productTitle.text = product.name
        productDescription.text = product.productDescription
        
        if let url = URL(string: product.imageURL) {
            productImage.kf.setImage(with: url)
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if let price = formatter.string(from: product.price as NSNumber) {
            productPrice.text = price
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissProducts))
        tap.numberOfTapsRequired = 1
        backgroundView.addGestureRecognizer(tap)
    }
    
    @objc func dismissProducts() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addCartClicked(_ sender: Any) {
        // Add product to cart
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissProduct(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
