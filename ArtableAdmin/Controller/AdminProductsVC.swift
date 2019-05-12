//
//  AdminProductsVC.swift
//  ArtableAdmin
//
//  Created by Jay Raval on 5/10/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import UIKit

class AdminProductsVC: ProductsVC {
    
    var selectedProduct: Product?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let editCategoryButtton = UIBarButtonItem(title: "Edit Category", style: .plain, target: self, action: #selector(editCategory))
        let newProductButton = UIBarButtonItem(title: "+ Product", style: .plain, target: self, action: #selector(newProduct))
        
        navigationItem.setRightBarButtonItems([editCategoryButtton, newProductButton], animated: false)
    }
    
    @objc func editCategory() {
        performSegue(withIdentifier: Segues.ToEditCategory, sender: self)
    }
    
    @objc func newProduct() {
        performSegue(withIdentifier: Segues.ToAddEditProduct, sender: self)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Editing product
        selectedProduct = products[indexPath.row]
        performSegue(withIdentifier: Segues.ToAddEditProduct, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.ToAddEditProduct {
            if let destination = segue.destination as? AddEditProductsVC {
                destination.selectedCategory = category
                destination.productToEdit = selectedProduct
            }
        } else if segue.identifier == Segues.ToEditCategory {
            if let destination = segue.destination as? AddEditCategoryVC {
                destination.categoryToEdit = category
            }
        }
    }
}
