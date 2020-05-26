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
        
        helper.fetchAll { (records) in
            self.histories = records
            DispatchQueue.main.async {
                self.historyTableView.reloadData()
            }
        }

        // Do any additional setup after loading the view.
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

extension UserHistoryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return 0
    }
}
