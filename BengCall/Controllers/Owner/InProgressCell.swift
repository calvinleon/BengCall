//
//  InProgressCell.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 19/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class InProgressCell: UITableViewCell {
    
    @IBOutlet weak var ProgressCell: UIView!
    @IBOutlet weak var BookingName: UILabel!
    @IBOutlet weak var BookingTime: UILabel!
    @IBOutlet weak var BookingMotorType: UILabel!
    @IBOutlet weak var BookingPlateNumber: UILabel!
    @IBOutlet weak var BookingPhoneNumber: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupProgressCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setupProgressCell(){
        self.ProgressCell.layer.cornerRadius = 8.0
        self.ProgressCell.layer.shadowColor = UIColor.darkGray.cgColor
        self.ProgressCell.layer.shadowRadius = 5
        self.ProgressCell.layer.shadowOpacity = 0.2
        self.ProgressCell.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    
}
