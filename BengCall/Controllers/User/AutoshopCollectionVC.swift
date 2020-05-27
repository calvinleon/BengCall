//
//  AutoshopCollectionVC.swift
//  BengCall
//
//  Created by Calvin Leonardo on 07/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit
import CloudKit

class AutoshopCollectionVC: UICollectionViewCell {
    
    let helper = CloudKitHelper()
    
    @IBOutlet weak var autoShopImgView: UIImageView!
    @IBOutlet weak var autoShopNameLbl: UILabel!
    @IBOutlet weak var autoShopAddressLbl: UILabel!
    @IBOutlet weak var serviceStackView: UIStackView!
    @IBOutlet weak var serviceView1: UIView!
    @IBOutlet weak var serviceView2: UIView!
    @IBOutlet weak var serviceView3: UIView!
    @IBOutlet weak var bookBtn: UIButton!
    @IBOutlet weak var autoShopCapacity: UILabel!
    @IBOutlet weak var serviceLbl1: UILabel!
    @IBOutlet weak var serviceLbl2: UILabel!
    @IBOutlet weak var serviceLbl3: UILabel!
    
    
    @IBAction func bookBtn(_ sender: Any) {
        
//        helper.saveBooking(customerName: "Calvin", motorType: "Suzuki CBR 1000", licensePlate: "B 4388 CBR", phoneNumber: "6281234567899", datetime: Date(), autoshopName: "PT Bahagia Selalu")
        
    }
    
    
    var autoShop: AutoShop! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let autoShop = autoShop {
            autoShopImgView.image = autoShop.autoShopImg
            autoShopNameLbl.text = autoShop.autoShopName
            autoShopAddressLbl.text = autoShop.autoShopAddress
            autoShopCapacity.text = autoShop.autoShopCapatiy
            serviceLbl1.text = autoShop.autoShopServices[0]
            serviceLbl2.text = autoShop.autoShopServices[1]
            serviceLbl3.text = autoShop.autoShopServices[2]
        } 
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 5.0
        self.layer.borderColor = UIColor.clear.cgColor
        
        self.serviceView1.layer.cornerRadius = 8.0
        self.serviceView2.layer.cornerRadius = 8.0
        self.serviceView3.layer.cornerRadius = 8.0
        self.bookBtn.layer.cornerRadius = 8.0
        
        self.contentView.layer.cornerRadius = 15.0
        self.contentView.layer.borderWidth = 5.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 0.0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.6
        self.layer.cornerRadius = 15.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
}
    

