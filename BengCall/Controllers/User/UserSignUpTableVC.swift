//
//  UserSignUpTableVC.swift
//  BengCall
//
//  Created by Setiawan Joddy on 21/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class UserSignUpTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}
