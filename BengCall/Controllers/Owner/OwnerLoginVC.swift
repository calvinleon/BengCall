//
//  OwnerLoginVC.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 23/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit
import CoreData

class OwnerLoginVC: UIViewController {

    @IBOutlet weak var ownerLoginButton: UIButton!
    
    var ownerLoginTexField: OwnerLoginTableVC?
    
    var ownerEmail: String?
    var ownerPassword: String?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var ownerData = [Owner]()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        setupButton()
        
        //self.navigationController?.delegate = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let sourceVC = segue.destination as? OwnerLoginTableVC, segue.identifier == "embedLogin" {
            
            self.ownerLoginTexField = sourceVC
        }
    }
    
    
    
    @IBAction func ownerLoginButtonPressed(_ sender: UIButton) {
        
        guard let email = ownerLoginTexField?.ownerLoginEmailTextField.text else { return }
        guard let password = ownerLoginTexField?.ownerLoginPasswordTextField.text else { return }
        
        if email.isEmpty && password.isEmpty {
            alertLogin(msg: "All Textfield")
        } else if email.isEmpty {
            alertLogin(msg: "Email")
        } else if password.isEmpty {
            alertLogin(msg: "Password")
        }
        
        ownerEmail = email
        ownerPassword = password
        
        // Try to login
        loadOwnerData()
        
        
    }
    
    
    @IBAction func unwindToLogin(sender: UIStoryboardSegue){
        
    }
    
    
    
    func loadOwnerData(with request: NSFetchRequest<Owner> = Owner.fetchRequest() ){
        
        let emailPredicate = NSPredicate(format: "email == %@", self.ownerEmail!)
        let passwordPredicate = NSPredicate(format: "password == %@", self.ownerPassword!)
        
        let compoundPredicate = NSCompoundPredicate.init(type: .and, subpredicates: [emailPredicate, passwordPredicate])
        
        print("Login Predicate = \(emailPredicate) and \(passwordPredicate)")
        
        request.predicate = compoundPredicate
        
        do {
            ownerData = try context.fetch(request)
            
            if !ownerData.isEmpty {
                
                self.performSegue(withIdentifier: "ownerLogin", sender: self)
                
                print("\(ownerData)")
                
            } else {
                
                print("owner data is Nil \(ownerData)")
                alertLogin(msg: "Email or Password incorrect!")
                
            }
            
            
        } catch {
            print("=======\n\nError fetching owner login data from context \(error)\n\n=======")
        }
        
    }
    

}


extension OwnerLoginVC {
    
    func setupButton(){
        ownerLoginButton.layer.masksToBounds = false
        ownerLoginButton.layer.cornerRadius = 8
        ownerLoginButton.layer.shadowColor = UIColor.darkGray.cgColor
        ownerLoginButton.layer.shadowRadius = 3
        ownerLoginButton.layer.shadowOpacity = 0.5
        ownerLoginButton.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    func alertLogin(msg: String){
        let alert = UIAlertController(title: "Failed", message: "\(msg)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel) { (cancel) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
}
