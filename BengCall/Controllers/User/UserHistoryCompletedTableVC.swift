//
//  UserHistoryCompletedTableVC.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 28/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class UserHistoryCompletedTableVC: UITableViewController {

    var completedData = [
        BookingModel(bookingId: 0, name: "AHASS Omega Motor", bookingTime: "07.00 WIB", motorType: "Vario 150CC", motorNumber: "B2122CWE", phoneNumber: "082127665578"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        
        self.tableView.tableFooterView = UIView()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return completedData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "completeBooking", for: indexPath) as! UserHistoryCompletedBookingCell
        
        let dataIndex = completedData[indexPath.row]
        
        cell.autoshopName.text = dataIndex.name
        cell.motorType.text = dataIndex.motorType
        cell.licensePlateNo.text = dataIndex.motorNumber
        cell.bookingTime.text = dataIndex.bookingTime
        cell.userPhoneNo.text = dataIndex.phoneNumber
        

        return cell
    }
    
    
    

    

}
