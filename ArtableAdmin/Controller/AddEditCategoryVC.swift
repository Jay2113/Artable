//
//  AddEditCategoryVC.swift
//  ArtableAdmin
//
//  Created by Jay Raval on 5/8/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore

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
        activityIndicator.startAnimating()
        uploadImageThenDocument()
    }
    
    func uploadImageThenDocument() {
        
        guard let image = categoryImage.image, let categoryName = nameText.text, categoryName.isNotEmpty else {
            simpleAlert(title: "Error", message: "Must add category image and name")
            return
        }
        
        // Step 1: Turn the image into Data
        guard let imageData = image.jpegData(compressionQuality: 0.2) else { return }
        
        // Step 2: Create a storage image reference -> A location in Firestorage for it to be stored.
        let imageReference = Storage.storage().reference().child("/categoryImages/\(categoryName).jpg")
        
        // Step 3: Set the meta data
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        // Step 4: Upload the data
        imageReference.putData(imageData, metadata: metaData) { (metaData, error) in
            if let error = error {
                self.handleError(error: error, message: "Unable to upload image.")
                return
            }
            
            // Step 5: Once the image is uploaded, retrieve the download URL
            imageReference.downloadURL(completion: { (url, error) in
                if let error = error {
                    self.handleError(error: error, message: "Unable to retrieve the image url.")
                    return
                }
                
                guard let url = url else { return }
                
                // Step 6: Upload the new Category document to the Firestore categories collection.
                self.uploadDocument(url: url.absoluteString)
                
            })
        }
    }
    
    func uploadDocument(url: String) {
        var documentReference: DocumentReference!
        var category = Category.init(name: nameText.text!, id: "", imageURL: url, timeStamp: Timestamp())
        
        documentReference = Firestore.firestore().collection("categories").document()
        category.id = documentReference.documentID
        
        let data = Category.modelToData(category: category)
        documentReference.setData(data, merge: true) { (error) in
            if let error = error {
                self.handleError(error: error, message: "Unable to upload new category to Firestore")
                return
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func handleError(error: Error, message: String) {
        debugPrint(error.localizedDescription)
        self.simpleAlert(title: "Error", message: message)
        self.activityIndicator.stopAnimating()
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
