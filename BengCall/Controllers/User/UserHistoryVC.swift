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
    var histories: [CKRecord] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTableView.delegate = self
        
//        helper.fetchAll { (records) in
//            self.histories = records
//            DispatchQueue.main.async {
//                self.historyTableView.reloadData()
//            }
//        }

    }
}

extension UserHistoryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "completedBookings", for: indexPath)
        
        cell.textLabel?.text = histories[indexPath.row]["name"] as? String
        
        return cell
    }
}
