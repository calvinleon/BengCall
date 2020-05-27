//
//  UserHistoryCurrentBookingCell.swift
//  BengCall
//
//  Created by Setiawan Joddy on 27/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class UserHistoryCurrentBookingCell: UITableViewCell {
    
    @IBOutlet weak var autoshopName: UILabel!
    @IBOutlet weak var serviceTime: UILabel!
    @IBOutlet weak var motorcycleModel: UILabel!
    @IBOutlet weak var licensePlateNo: UILabel!
    @IBOutlet weak var userPhoneNo: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
