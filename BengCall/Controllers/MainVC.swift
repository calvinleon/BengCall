//
//  ViewController.swift
//  BengCall
//
//  Created by Calvin Leonardo on 06/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var ownerBtn: UIButton!
    @IBOutlet weak var userBtn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        userBtn.layer.cornerRadius = 8.0
//        ownerBtn.layer.cornerRadius = 8.0
    }


}

