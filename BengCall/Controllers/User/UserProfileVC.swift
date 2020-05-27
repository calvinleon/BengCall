//
//  UserProfileVC.swift
//  BengCall
//
//  Created by Setiawan Joddy on 07/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController {
    
    
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView(){
        logoutButton.layer.masksToBounds = false
        logoutButton.layer.cornerRadius = 8
        logoutButton.layer.shadowColor = UIColor.darkGray.cgColor
        logoutButton.layer.shadowRadius = 3
        logoutButton.layer.shadowOpacity = 0.5
        logoutButton.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    @IBAction func unwindSaveEditUser(sender: UIStoryboardSegue){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func unwindCancelEditUser(sender: UIStoryboardSegue){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}
