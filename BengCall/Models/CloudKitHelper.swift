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
        booking["customerName"] = customerName
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
    
    
    
    fileprivate func updateDate() {
        let id = CKRecord.ID(recordName: "isDone")
        let booking = CKRecord(recordType: "Booking")
        
        database.fetch(withRecordID: id) { (record, error) in
            
            if let record = record, error == nil {
                
                // update your record here
                booking["isDone"] = true
                
                self.database.save(record) { (_, error) in
                    if error != nil {
                        print("error when updating data \(error ?? "nil" as! Error)")
                    } else {
                        print("update record isDone = \(booking["isDone"] ?? "nil" )")
                    }
                }
            }
            
        }
    }
    
    func confirmUpdateBooking(custName: String, onCompleted: @escaping ([CKRecord]) -> Void){
        
        let predicate = NSPredicate(format: "customerName MATCHES[cd] @%", custName)
        let query = CKQuery(recordType: "Booking", predicate: predicate)
        
        database.perform(query, inZoneWith: nil) { (records, error) in
            onCompleted(records!)
            
            self.updateDate()
        }
        
        
        
    }
}
