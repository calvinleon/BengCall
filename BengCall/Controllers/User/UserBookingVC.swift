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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.dataSource = self
        calendar.delegate = self
        calendar.scope = FSCalendarScope.week
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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

