//
//  OwnerLoginVC.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 23/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class OwnerLoginVC: UIViewController {

    @IBOutlet weak var ownerLoginButton: UIButton!
    
    var ownerLoginTexField: OwnerLoginTableVC?
    
    var ownerEmail: String?
    var ownerPassword: String?
    
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
            alertLogin()
        } else if email.isEmpty {
            alertLogin()
        } else if password.isEmpty {
            alertLogin()
        }
        
        ownerEmail = email
        ownerPassword = password
        
        
    }
    
    
    @IBAction func unwindToLogin(sender: UIStoryboardSegue){
        
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
    
    func alertLogin(){
        
        let alert = UIAlertController(title: "Failed", message: "Email and Password is empty", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel) { (cancel) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
}
