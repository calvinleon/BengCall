//
//  OwnerProfileTableVC.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 21/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class OwnerProfileTableVC: UITableViewController {

    @IBOutlet weak var autoshopImageView: UIImageView!
    @IBOutlet weak var autoshopNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        self.autoshopImageView.layer.cornerRadius = 10
        self.tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    @IBAction func unwindCancelEditOwner(sender: UIStoryboardSegue){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func unwindSaveEditOwner(sender: UIStoryboardSegue){
        
        self.dismiss(animated: true, completion: nil)
    }

}
