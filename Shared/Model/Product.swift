//
//  Product.swift
//  Artable
//
//  Created by Jay Raval on 4/26/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Product {
    var name: String
    var id: String
    var category: String
    var price: Double
    var productDescription: String
    var imageURL: String
    var timeStamp: Timestamp
    var stock: Int
    var favorite: Bool
}
