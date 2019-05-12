//
//  ProductCell.swift
//  Artable
//
//  Created by Jay Raval on 4/26/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCell: UITableViewCell {

    @IBOutlet weak var productImage: RoundedImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(product: Product) {
        productTitle.text = product.name
        
        if let url = URL(string: product.imageURL) {
            let placeholder = UIImage(named: "placeholder")
            productImage.kf.indicatorType = .activity
            let options: KingfisherOptionsInfo = [KingfisherOptionsInfoItem.transition(.fade(0.2))]
            productImage.kf.setImage(with: url, placeholder: placeholder, options: options)
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if let price = formatter.string(from: product.price as NSNumber) {
            productPrice.text = price
        }
    }
    
    @IBAction func addToCartClicked(_ sender: Any) {
    }
    
    @IBAction func favoriteButtonClicked(_ sender: Any) {
    }
    
}
