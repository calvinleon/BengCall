//
//  UserHistoryCompletedBookingCell.swift
//  BengCall
//
//  Created by Setiawan Joddy on 27/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class UserHistoryCompletedBookingCell: UITableViewCell {
    
    
    @IBOutlet weak var insideCellView: UIView!
    @IBOutlet weak var autoshopName: UILabel!
    @IBOutlet weak var bookingTime: UILabel!
    @IBOutlet weak var motorType: UILabel!
    @IBOutlet weak var licensePlateNo: UILabel!
    @IBOutlet weak var userPhoneNo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCompleteCellView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCompleteCellView(){
        self.insideCellView.layer.cornerRadius = 8.0
        self.insideCellView.layer.shadowColor = UIColor.darkGray.cgColor
        self.insideCellView.layer.shadowRadius = 5
        self.insideCellView.layer.shadowOpacity = 0.2
        self.insideCellView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
    }

}
