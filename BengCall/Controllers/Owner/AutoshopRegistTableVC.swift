//
//  AutoshopRegistTableVC.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 23/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit
import CoreData

class AutoshopRegistTableVC: UITableViewController {

    @IBOutlet weak var autoshopNameTF: UITextField!
    @IBOutlet weak var autoshopAddressTF: UITextField!
    
    @IBOutlet weak var uploadFileButton: UIButton!
    @IBOutlet weak var takeSelfieButton: UIButton!
    
    @IBOutlet weak var autoshopImage: UIImageView!
    @IBOutlet weak var autoshopPhotoButton: UIButton!
    
    var ownerIDCardImage = UIImageView()
    var ownerSelfieIDCard = UIImageView()
    
    var senderTag = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
    }

    
    @IBAction func ownerIDCardButtonPressed(_ sender: UIButton) {
        showImagePickerActionSheet(tag: sender.tag)
        
    }
    
    
    @IBAction func ownerSelfieIDCardButtonPressed(_ sender: UIButton) {
        showImagePickerActionSheet(tag: sender.tag)
    }
    
    
    
    @IBAction func autoshopPhotoButtonPressed(_ sender: UIButton) {
        
        showImagePickerActionSheet(tag: sender.tag)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    

}


extension AutoshopRegistTableVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func setupButton(){
        uploadFileButton.layer.cornerRadius = 8
        uploadFileButton.tag = 101
        
        takeSelfieButton.layer.cornerRadius = 8
        takeSelfieButton.tag = 102
        
        autoshopImage.layer.cornerRadius = 8
        autoshopPhotoButton.tag = 103
    }

    
    func showImagePickerActionSheet(tag: Int){
        
        self.senderTag = tag
        
        let actionSheet = UIAlertController(title: "Choose Photo From", message: "Camera or Photo Library", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let fromCamera = UIAlertAction(title: "Camera", style: .default) { (action) in
            
            self.showImagePickerController(sourceType: .camera)
        }
        let fromLibrary = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        
        actionSheet.addAction(fromCamera)
        actionSheet.addAction(fromLibrary)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    func showImagePickerController(sourceType: UIImagePickerController.SourceType){
        
        let imgPickerController = UIImagePickerController()
        imgPickerController.delegate = self
        imgPickerController.allowsEditing = true
        imgPickerController.sourceType = sourceType
        
        self.present(imgPickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            switch self.senderTag {
            case 101:
                ownerIDCardImage.image = editedImage
                uploadFileButton.setTitle("Upload File Success !!", for: .normal)
            case 102:
                ownerSelfieIDCard.image = editedImage
                takeSelfieButton.setTitle("Upload File Success !!", for: .normal)
            case 103:
                autoshopImage.image = editedImage
                autoshopPhotoButton.setTitle("Edit", for: .normal)
            default:
                break
            }
            /*
            if self.senderTag == 101 {
                ownerIDCardImage.image = editedImage
                uploadFileButton.titleLabel?.text = "Upload File Success !!"
            } else if self.senderTag == 102 {
                ownerSelfieIDCard.image = editedImage
                takeSelfieButton.titleLabel?.text = "Upload File Success !!"
            } else {
                autoshopImage.image = editedImage
                autoshopPhotoButton.titleLabel?.text = "Edit"
            }*/
            
            
            
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            switch self.senderTag {
            case 101:
                ownerIDCardImage.image = originalImage
                uploadFileButton.setTitle("Upload File Success !!", for: .normal)
            case 102:
                ownerSelfieIDCard.image = originalImage
                takeSelfieButton.setTitle("Upload File Success !!", for: .normal)
            case 103:
                autoshopImage.image = originalImage
                autoshopPhotoButton.setTitle("Edit", for: .normal)
            default:
                break
            }
            
            /*
            if self.senderTag == 101 {
                ownerIDCardImage.image = originalImage
                uploadFileButton.setTitle("Upload File Success !!", for: .normal)
            } else if self.senderTag == 102 {
                ownerSelfieIDCard.image = originalImage
                takeSelfieButton.setTitle("Upload File Success !!", for: .normal)
            } else {
                autoshopImage.image = originalImage
                autoshopPhotoButton.titleLabel?.text = "Edit"
            }*/
            
        }
        
        self.dismiss(animated: true, completion: nil)
    }

    
}
