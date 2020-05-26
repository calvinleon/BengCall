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
    @IBOutlet weak var serviceView1: UIView!
    @IBOutlet weak var serviceView2: UIView!
    @IBOutlet weak var serviceView3: UIView!
    @IBOutlet weak var serviceView4: UIView!
    @IBOutlet weak var bookBtn: UIButton!
    
    var autoshopName = ""
    var autoshopDesc = ""
    var autoshopAdress = ""
    var autoshopImg = UIImage()

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        autoshopNameLbl.text = autoshopName
        descLbl.text = autoshopDesc
        
        initialSetup()
    }
    
    func initialSetup() {
        detailView.layer.cornerRadius = 15.0
        serviceView1.layer.cornerRadius = 7
        serviceView2.layer.cornerRadius = 7
        serviceView3.layer.cornerRadius = 7
        serviceView4.layer.cornerRadius = 7
               
        bookBtn.layer.cornerRadius = 7
    }
}
