//
//  OwnerBookListVC.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 07/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class OwnerBookListVC: UIViewController {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var waitingListContainerView: UIView!
    @IBOutlet weak var inProgressContainerView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bookingStatusSegmented(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            waitingListContainerView.alpha = 1
            inProgressContainerView.alpha = 0
        case 1:
            waitingListContainerView.alpha = 0
            inProgressContainerView.alpha = 1
        default:
            waitingListContainerView.alpha = 1
            inProgressContainerView.alpha = 0
        }
    }
    
    
}
