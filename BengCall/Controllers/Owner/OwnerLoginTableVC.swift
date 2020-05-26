//
//  OwnerLoginTableVC.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 23/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class OwnerLoginTableVC: UITableViewController {

    @IBOutlet weak var ownerLoginEmailTextField: UITextField!
    @IBOutlet weak var ownerLoginPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ownerLoginPasswordTextField.isSecureTextEntry = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    


}
