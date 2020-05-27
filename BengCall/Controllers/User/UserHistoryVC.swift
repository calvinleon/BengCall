//
//  UserHistoryVC.swift
//  BengCall
//
//  Created by Setiawan Joddy on 07/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit
import CloudKit

class UserHistoryVC: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var historyTableView: UITableView!
    
    let helper = CloudKitHelper()
    
    var histories = [CKRecord]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        helper.fetchAll(autoshopName: "") { (records) in
            
            self.histories = records
            
            DispatchQueue.main.async {
                self.historyTableView.reloadData()
            }
        }

    }
}


extension UserHistoryVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "completedBookings", for: indexPath) as! UserHistoryCompletedBookingCell
        
        let dataIndex = histories[indexPath.row]
                cell.autoshopName.text = dataIndex["autoshopName"]
        //        cell.serviceTime.text = dataIndex["datetime"]
                cell.motorType.text = dataIndex["motorType"]
                cell.licensePlateNo.text = dataIndex["licensePlate"]
                cell.userPhoneNo.text = dataIndex["phoneNumber"]
                
                cell.selectionStyle = .none

                return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92.0
    }
}
