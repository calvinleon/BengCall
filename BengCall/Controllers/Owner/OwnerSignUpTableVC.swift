//
//  OwnerSignUpTableVC.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 23/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class OwnerSignUpTableVC: UITableViewController {
    
    @IBOutlet weak var ownerNameTF: UITextField!
    @IBOutlet weak var ownerEmailTF: UITextField!
    @IBOutlet weak var ownerPasswordTF: UITextField!
    @IBOutlet weak var ownerReenterPasswordTF: UITextField!
    @IBOutlet weak var ownerPhoneNumberTF: UITextField!
    @IBOutlet weak var ownerCapacityTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        ownerPasswordTF.isSecureTextEntry = true
        ownerReenterPasswordTF.isSecureTextEntry = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
