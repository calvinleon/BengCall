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
    
    @IBOutlet weak var ownerLogOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButton()
        
        self.autoshopImageView.layer.cornerRadius = 10
        self.tableView.tableFooterView = UIView()
    }
    
    func setupButton(){
        ownerLogOut.layer.masksToBounds = false
        ownerLogOut.layer.cornerRadius = 8
        ownerLogOut.layer.shadowColor = UIColor.darkGray.cgColor
        ownerLogOut.layer.shadowRadius = 3
        ownerLogOut.layer.shadowOpacity = 0.5
        ownerLogOut.layer.shadowOffset = CGSize(width: 0, height: 3)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
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
