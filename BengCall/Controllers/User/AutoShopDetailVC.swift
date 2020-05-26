//
//  AutoShopDetailVC.swift
//  BengCall
//
//  Created by Calvin Leonardo on 17/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class AutoShopDetailVC: UIViewController {
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var autoshopNameLbl: UILabel!
    
    var autoshopName = ""
    var autoshopDesc = ""
    var autoshopAdress = ""
    var autoshopImg = UIImage()

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        autoshopNameLbl.text = autoshopName
        
        
        detailView.layer.cornerRadius = 15.0        
        descLbl.text = "TestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollViewTestScrollView"
        
        
    }
}
