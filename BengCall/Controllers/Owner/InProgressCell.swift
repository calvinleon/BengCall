//
//  InProgressCell.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 19/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit
import CloudKit

protocol InProgressCellDelegate {
    //func
}

class InProgressCell: UITableViewCell {
    
    @IBOutlet weak var ProgressCell: UIView!
    
    @IBOutlet weak var BookingName: UILabel!
    @IBOutlet weak var BookingTime: UILabel!
    @IBOutlet weak var BookingMotorType: UILabel!
    @IBOutlet weak var BookingPlateNumber: UILabel!
    @IBOutlet weak var BookingPhoneNumber: UILabel!
    
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var CallButton: UIButton!
    
    var bookingItem: BookingModel!
    var delegate: InProgressCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupProgressCellView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setupProgressCellView(){
        self.ProgressCell.layer.cornerRadius = 8.0
        self.ProgressCell.layer.shadowColor = UIColor.darkGray.cgColor
        self.ProgressCell.layer.shadowRadius = 5
        self.ProgressCell.layer.shadowOpacity = 0.2
        self.ProgressCell.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        self.DoneButton.layer.cornerRadius = 6.0
        self.CallButton.layer.cornerRadius = 6.0
    }
    
    //bookingData: BookingModel
    func setupInsideCell(bookingData: CKRecord){
        //bookingItem = bookingData
        BookingName.text = bookingData["customerName"]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH.mm"
        
        let bookingDate = dateFormatter.string(from: bookingData["datetime"] as! Date)
        
        BookingTime.text = bookingDate
        BookingMotorType.text = bookingData["motorType"]
        BookingPlateNumber.text = bookingData["licensePlate"]
        BookingPhoneNumber.text = bookingData["phoneNumber"]
        
        // Creata a tag for the button
        //DoneButton.tag = bookingData.bookingId
        //CallButton.tag = bookingData.bookingId
    }
    
//    func setupInsideCell(bookingData: BookingModel){
//        bookingItem = bookingData
//        BookingName.text = bookingData.name
//        BookingTime.text = bookingData.bookingTime
//        BookingMotorType.text = bookingData.motorType
//        BookingPlateNumber.text = bookingData.motorNumber
//        BookingPhoneNumber.text = bookingData.phoneNumber
//
//        // Creata a tag for the button
//        DoneButton.tag = bookingData.bookingId
//        CallButton.tag = bookingData.bookingId
//    }
    
    
}
