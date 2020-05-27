//
//  OnboardingVC.swift
//  BengCall
//
//  Created by Calvin Leonardo on 27/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var userBtn: UIButton!
    @IBOutlet weak var ownerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userBtn.layer.cornerRadius = 8.0
        ownerBtn.layer.cornerRadius = 8.0
        
    }
    
    
}
