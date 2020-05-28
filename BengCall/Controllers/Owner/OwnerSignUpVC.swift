//
//  OwnerSignUpVC.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 23/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit
import CoreData

class OwnerSignUpVC: UIViewController {
    
    @IBOutlet weak var ownerSignUpButton: UIButton!
    
    var ownerSignUpTexField: OwnerSignUpTableVC?
    
    var ownerName: String?
    var ownerEmail: String?
    var ownerPassword: String?
    var ownerPhoneNumber: String?
    var ownerCapacity: String?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let signUpTableVC = segue.destination as? OwnerSignUpTableVC, segue.identifier == "embedSignUp" {
            
            ownerSignUpTexField = signUpTableVC
        }
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        
        updateData(sourceVC: ownerSignUpTexField)
        
        self.view.endEditing(true)
        
        let newOwnerItem = Owner(context: self.context)
        newOwnerItem.name = ownerName
        newOwnerItem.email = ownerEmail
        newOwnerItem.password = ownerPassword
        newOwnerItem.phoneNumber = ownerPhoneNumber
        newOwnerItem.capacity = ownerCapacity
        
        saveItem()
        
        
        //self.performSegue(withIdentifier: "signupToRegistration", sender: self)
        
    }
    
    
    func saveItem(){
        
        do {
            try context.save()
        } catch {
            print("Error saving context (Owner Sign Up) \(error)")
        }
    }
    
    @IBAction func unwinToSignUp(sender: UIStoryboardSegue){
        
    }
    
    
}

extension OwnerSignUpVC {
    
    func setupButton(){
        ownerSignUpButton.layer.masksToBounds = false
        ownerSignUpButton.layer.cornerRadius = 8
        ownerSignUpButton.layer.shadowColor = UIColor.darkGray.cgColor
        ownerSignUpButton.layer.shadowRadius = 3
        ownerSignUpButton.layer.shadowOpacity = 0.5
        ownerSignUpButton.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    func updateData(sourceVC: OwnerSignUpTableVC?){
        
        guard let name = sourceVC?.ownerNameTF.text, name != "" else {
            alertLogin(msg: "Name")
            return }
        guard let email = sourceVC?.ownerEmailTF.text, email != "" else {
            alertLogin(msg: "Email")
            return }
        guard let password = sourceVC?.ownerPasswordTF.text, password != "" else {
            alertLogin(msg: "Password")
            return }
        guard (sourceVC?.ownerPasswordTF.text) != "" else {
            alertLogin(msg: "Re-enter password")
            return }
        guard let number = sourceVC?.ownerPhoneNumberTF.text, number != "" else {
            alertLogin(msg: "Phone Number")
            return }
        guard let capacity = sourceVC?.ownerCapacityTF.text, capacity != "" else {
            alertLogin(msg: "Capacity")
            return }
        
        if name.isEmpty && email.isEmpty && password.isEmpty && number.isEmpty && capacity.isEmpty {
            alertLogin(msg: "All Textfield")
        } /*else if name.isEmpty {
             alertLogin(msg: "name")
             } else if email.isEmpty {
             alertLogin(msg: "email")
             } else if password.isEmpty {
             alertLogin(msg: "password")
             } else if reenterpassword.isEmpty {
             alertLogin(msg: "re-enter password")
             } else if number.isEmpty {
             alertLogin(msg: "number")
             } else if capacity.isEmpty {
             alertLogin(msg: "capacity")
         }*/ else {
            
            self.ownerName = name
            self.ownerEmail = email
            self.ownerPassword = password
            self.ownerPhoneNumber = number
            self.ownerCapacity = capacity
            
            
            showActivityIndicator()
            
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
        
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
            
            indicator.stopAnimating()
            backgroundView.removeFromSuperview()
            
            self.performSegue(withIdentifier: "signupToRegistration", sender: self)
            
        }
    }
    
    
}
