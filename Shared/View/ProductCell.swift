//
//  ProductCell.swift
//  Artable
//
//  Created by Jay Raval on 4/26/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import UIKit

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
            productImage.kf.setImage(with: url)
        }
    }
    
    @IBAction func addToCartClicked(_ sender: Any) {
    }
    
    @IBAction func favoriteButtonClicked(_ sender: Any) {
    }
    
}
