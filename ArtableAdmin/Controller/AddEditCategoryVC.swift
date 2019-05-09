//
//  AddEditCategoryVC.swift
//  ArtableAdmin
//
//  Created by Jay Raval on 5/8/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import UIKit

class AddEditCategoryVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var categoryImage: RoundedImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        tap.numberOfTapsRequired = 1
        categoryImage.isUserInteractionEnabled = true
        categoryImage.addGestureRecognizer(tap)
    }
    
    @objc func imageTapped() {
        // Launch the image picker
        launchImagePicker()
        
    }
    
    @IBAction func addCategoryClicked(_ sender: Any) {
        
    }
}

extension AddEditCategoryVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func launchImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        categoryImage.contentMode = .scaleAspectFill
        categoryImage.image = image
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
