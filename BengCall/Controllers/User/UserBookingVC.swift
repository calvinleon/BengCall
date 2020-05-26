//
//  UserBookingVC.swift
//  BengCall
//
//  Created by Setiawan Joddy on 07/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit
import FSCalendar


class UserBookingVC: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    var selectedDate = Date()
    var bookingTime = ""
    var phoneNumber = ""
    var motorType = ""
    var motorNumber = ""
    var name = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.dataSource = self
        calendar.delegate = self
        calendar.scope = FSCalendarScope.week
        
        
    }
    

}

extension UserBookingVC: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        
        if let tempDate = calendar.selectedDate{
            selectedDate = tempDate
        }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
//        dateLbl.text = formatter.string(from: selectedDate)

    }
    
}

