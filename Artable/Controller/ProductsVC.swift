//
//  ProductsVC.swift
//  Artable
//
//  Created by Jay Raval on 4/26/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ProductsVC: UIViewController {

    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var products = [Product]()
    var category: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let product = Product(name: "Landscape", id: "asdasad", category: "Nature", price: 24.99, productDescription: "Great Product!", imageURL: "https://images.unsplash.com/photo-1555979864-7a8f9b4fddf8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80", timeStamp: Timestamp(), stock: 0, favorite: false)
        products.append(product)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Identifiers.ProductCell, bundle: nil), forCellReuseIdentifier: Identifiers.ProductCell)
    }
}

extension ProductsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.ProductCell, for: indexPath) as? ProductCell {
            cell.configureCell(product: products[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
