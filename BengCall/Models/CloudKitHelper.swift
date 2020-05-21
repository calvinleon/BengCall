//
//  CloudKitHelper.swift
//  BengCall
//
//  Created by Setiawan Joddy on 21/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import Foundation
import CloudKit

struct CloudKitHelper {
    
    var container: CKContainer
    var database: CKDatabase
    
    init() {
        
        container = CKContainer.init(identifier: "iCloud.com.Group10.BengCall")
        database = container.publicCloudDatabase
    }
    
    func saveBooking(customerName: String, motorType: String, licensePlate: String, phoneNumber: String, datetime: Date, autoshopName: String, isDone: Bool = false) {
        
        let booking = CKRecord(recordType: "Booking")
        booking["customerName"] =  customerName
        booking["motorType"] = motorType
        booking["licensePlate"] = licensePlate
        booking["phoneNumber"] = phoneNumber
        booking["datetime"] = datetime
        booking["autoshopName"] = autoshopName
        booking["isDone"] = isDone
        
        database.save(booking) { (record, error) in
            print(record)
            print(error)
        }
    }
    
    func fetchAll (onCompleted: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Booking", predicate: predicate)
        
        database.perform(query, inZoneWith: nil) { (records, error) in
            onCompleted(records!)
        }
    }
}
