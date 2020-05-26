//
//  AutoshopRegistrationVC.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 23/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class AutoshopRegistrationVC: UIViewController {

    @IBOutlet weak var ownerRegisterAutoshopButton: UIButton!
    
    var autoshopRegistTableVC: AutoshopRegistTableVC?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupButton()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let autoshopRegist = segue.destination as? AutoshopRegistTableVC, segue.identifier == "embedAutoshopRegister" {
            
            self.autoshopRegistTableVC = autoshopRegist
            
        }
    }
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        // Saving Autoshop Data
        updateData(sourceVC: autoshopRegistTableVC)
        
    }
    
    
    func saveItem(){
        
        do {
            try context.save()
            print("=========== \n\nAutoshop Registration is Succes!! \n\n===========")
            
        } catch {
            print("Error saving context (Autoshop Registration) \(error)")
        }
        
    }
    

}

extension AutoshopRegistrationVC {
    
    func setupButton(){
        ownerRegisterAutoshopButton.layer.masksToBounds = false
        ownerRegisterAutoshopButton.layer.cornerRadius = 8
        ownerRegisterAutoshopButton.layer.shadowColor = UIColor.darkGray.cgColor
        ownerRegisterAutoshopButton.layer.shadowRadius = 3
        ownerRegisterAutoshopButton.layer.shadowOpacity = 0.5
        ownerRegisterAutoshopButton.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    
    func updateData(sourceVC: AutoshopRegistTableVC?){
        
        guard let autoshopName = sourceVC?.autoshopNameTF.text, autoshopName != "" else {
            alertLogin(msg: "Autoshop Name")
            return }
        
        guard let autoshopAddress = sourceVC?.autoshopAddressTF.text, autoshopAddress != "" else {
            alertLogin(msg: "Autoshop Address")
            return }
        
        guard (sourceVC?.ownerIDCardImage.image) != nil else {
            alertLogin(msg: "ID Card Image")
            return  }
        
        guard (sourceVC?.ownerSelfieIDCard.image) != nil else {
            alertLogin(msg: "Selfie with ID Card")
            return
        }
        
        guard (sourceVC?.autoshopImage.image) != nil else {
            alertLogin(msg: "Autoshop Image")
            return
        }
        
        // Update and Saving Data
        if !autoshopName.isEmpty && !autoshopAddress.isEmpty {

            let newAutoshopItem = Autoshop(context: context)
            newAutoshopItem.autoshopName = autoshopName
            newAutoshopItem.address = autoshopAddress
            
            if let idcardImg = sourceVC?.ownerIDCardImage.image {
                let idcardData = idcardImg.pngData() as NSData?
                
                newAutoshopItem.idCard = idcardData as Data?
            }
            
            if let idcardSelfie = sourceVC?.ownerSelfieIDCard.image {
                let idcardData = idcardSelfie.pngData() as NSData?
                
                newAutoshopItem.selfieIdCard = idcardData as Data?
            }
            
            if let autoshopImg = sourceVC?.autoshopImage.image {
                let autoshopPhoto = autoshopImg.pngData() as NSData?
                
                newAutoshopItem.autoshopPhoto = autoshopPhoto as Data?
            }
            
            showActivityIndicator()
            
            self.saveItem()
            
        }
        
    }
    
    
    func alertLogin(msg: String){
        let alert = UIAlertController(title: "Failed", message: "\(msg) is Empty", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel) { (cancel) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func showActivityIndicator(){
        let backgroundView = UIView(frame: self.view.bounds)
        backgroundView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = backgroundView.center
        indicator.startAnimating()
        
        backgroundView.addSubview(indicator)
        self.view.addSubview(backgroundView)
        
        
        
        let alert = UIAlertController(title: "Registration Completed", message: "", preferredStyle: .alert)
        
        let login = UIAlertAction(title: "Login", style: .cancel) { (cancel) in
            
            alert.dismiss(animated: true, completion: nil)
            
            self.performSegue(withIdentifier: "afterRegistToLogin", sender: self)
        }
        
        alert.addAction(login)
        
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
            
            indicator.stopAnimating()
            backgroundView.removeFromSuperview()
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    
}
