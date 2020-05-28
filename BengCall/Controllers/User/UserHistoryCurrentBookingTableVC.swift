//
//  UserHistoryCurrentBookingTableVC.swift
//  BengCall
//
//  Created by Setiawan Joddy on 27/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit
import CloudKit

class UserHistoryCurrentBookingTableVC: UITableViewController {
    
    let helper = CloudKitHelper()
    
    var currentData = [CKRecord]()
    
    var selectedCellIndexPath: IndexPath?
    let selectedCellHeight: CGFloat = 195.0
    let unselectedCellHeight: CGFloat = 108.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        
        helper.fetchAll(autoshopName: "") { (record) in
            
            self.currentData = record
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCellIndexPath == indexPath {
            return selectedCellHeight
        }
        return unselectedCellHeight
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currentBooking", for: indexPath) as! UserHistoryCurrentBookingCell

        let dataIndex = currentData[indexPath.row]
        cell.autoshopName.text = dataIndex["autoshopName"]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH.mm"
        
        let bookingDate = dateFormatter.string(from: dataIndex["datetime"] as! Date)
        
        cell.serviceTime.text = bookingDate + " WIB"
        cell.motorcycleModel.text = dataIndex["motorType"]
        cell.licensePlateNo.text = dataIndex["licensePlate"]
        cell.userPhoneNo.text = dataIndex["phoneNumber"]
        
        cell.selectionStyle = .none

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectedCellIndexPath != nil && selectedCellIndexPath == indexPath {
            selectedCellIndexPath = nil
        } else {
            selectedCellIndexPath = indexPath
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        if selectedCellIndexPath != nil {
            // This ensures, that the cell is fully visible once expanded
            tableView.scrollToRow(at: indexPath, at: .none, animated: true)
        }
                
        print("Cell \(indexPath.row) selected")
    }
    
    

}
