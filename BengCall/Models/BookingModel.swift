//
//  BookingModel.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 20/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import Foundation

struct BookingModel {
    var bookingId: Int
    var name: String
    var bookingTime: String
    var motorType: String
    var motorNumber: String
    var phoneNumber: String
    
    init(bookingId: Int, name: String, bookingTime: String, motorType: String, motorNumber: String, phoneNumber: String) {
        
        self.bookingId = bookingId
        self.name = name
        self.bookingTime = bookingTime
        self.motorType = motorType
        self.motorNumber = motorNumber
        self.phoneNumber = phoneNumber
    }
}
