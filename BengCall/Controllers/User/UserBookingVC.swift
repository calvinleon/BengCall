//
//  UserBookingVC.swift
//  BengCall
//
//  Created by Setiawan Joddy on 07/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit
import FSCalendar
import CloudKit

class UserBookingVC: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    var selectedDate = Date()
    @IBOutlet weak var bookingBtn: UIButton!
    let helper = CloudKitHelper()
    
    var bookingDate = Date()
    var bookingTime = ""
    var phoneNumber = ""
    var motorType = ""
    
    var customerName = ""
    var licensePlate = ""
    var autoshopName = ""
    var isSelected = false
    
    var orangeColor = UIColor(red: 0.88, green: 0.40, blue: 0.22, alpha: 1.00)
    var defaultFontColor = UIColor(red: 0.20, green: 0.36, blue: 0.47, alpha: 1.00)
    var defaultColor = UIColor(red: 0.94, green: 0.93, blue: 0.93, alpha: 1.00)
    
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonSetup()
        
        customerName = "Arif Joddy"
        motorType = "Honda Vario 150"
        licensePlate = "B 4099 BXC"
        phoneNumber = "08999999999"
        autoshopName = "Agung Jaya Motor"
        
        calendar.dataSource = self
        calendar.delegate = self
        calendar.scope = FSCalendarScope.week
        
        bookingBtn.layer.cornerRadius = 8
    }
    
    @IBAction func bookBtn(_ sender: Any) {
         
        if self.isSelected == true{

        
        let alert = UIAlertController(title: "Booking", message: "Are you sure want to book?", preferredStyle: .alert)

             let ok = UIAlertAction(title: "Confirm", style: .default, handler: { action in
                    self.formatTime()
                    self.helper.saveBooking(customerName: self.customerName, motorType: self.motorType, licensePlate: self.licensePlate, phoneNumber: self.phoneNumber, datetime: self.bookingDate, autoshopName: self.autoshopName)
                   
                    self.performSegue(withIdentifier: "userHistorySegue", sender: self)

             })
                
             alert.addAction(ok)
             let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
             })
             alert.addAction(cancel)
             DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
        })
        } else {
            let alert = UIAlertController(title: "Booking", message: "Please Choose Date and Time", preferredStyle: .alert)
            self.present(alert, animated: true)

        }
        
    }
    
    @IBAction func pickTimeBtn(_ sender: UIButton) {
        switch sender {
        case btn1:
            bookingTime = "08:00"
            buttonInvalid()
            btn1.backgroundColor = orangeColor
            btn1.setTitleColor(UIColor.white, for: UIControl.State.normal)
            isSelected = true
        case btn2:
            bookingTime = "09:00"
            buttonInvalid()
            btn2.backgroundColor = orangeColor
            btn2.setTitleColor(UIColor.white, for: UIControl.State.normal)
            isSelected = true

        case btn3:
            bookingTime = "10:00"
            buttonInvalid()
            btn3.backgroundColor = orangeColor
            btn3.setTitleColor(UIColor.white, for: UIControl.State.normal)
            isSelected = true

        case btn4:
            bookingTime = "11:00"
            buttonInvalid()
            btn4.backgroundColor = orangeColor
            btn4.setTitleColor(UIColor.white, for: UIControl.State.normal)
            isSelected = true

        case btn5:
            bookingTime = "13:00"
            buttonInvalid()
            btn5.backgroundColor = orangeColor
            btn5.setTitleColor(UIColor.white, for: UIControl.State.normal)
            isSelected = true

        case btn6:
            bookingTime = "14:00"
            buttonInvalid()
            btn6.backgroundColor = orangeColor
            btn6.setTitleColor(UIColor.white, for: UIControl.State.normal)
            isSelected = true

        case btn7:
            bookingTime = "15:00"
            buttonInvalid()
            btn7.backgroundColor = orangeColor
            btn7.setTitleColor(UIColor.white, for: UIControl.State.normal)
            isSelected = true

        case btn8:
            bookingTime = "16:00"
            buttonInvalid()
            btn8.backgroundColor = orangeColor
            btn8.setTitleColor(UIColor.white, for: UIControl.State.normal)
            isSelected = true

        case btn9:
            bookingTime = "17:00"
            buttonInvalid()
            btn9.backgroundColor = orangeColor
            btn9.setTitleColor(UIColor.white, for: UIControl.State.normal)
            isSelected = true

        default:
            bookingTime = ""
        }
        
    }
    
    func buttonInvalid() {
        btn1.backgroundColor = defaultColor
        btn2.backgroundColor = defaultColor
        btn3.backgroundColor = defaultColor
        btn4.backgroundColor = defaultColor
        btn5.backgroundColor = defaultColor
        btn6.backgroundColor = defaultColor
        btn7.backgroundColor = defaultColor
        btn8.backgroundColor = defaultColor
        btn9.backgroundColor = defaultColor
        
        btn1.setTitleColor(defaultFontColor, for: .normal)
        btn2.setTitleColor(defaultFontColor, for: .normal)
        btn3.setTitleColor(defaultFontColor, for: .normal)
        btn4.setTitleColor(defaultFontColor, for: .normal)
        btn5.setTitleColor(defaultFontColor, for: .normal)
        btn6.setTitleColor(defaultFontColor, for: .normal)
        btn7.setTitleColor(defaultFontColor, for: .normal)
        btn8.setTitleColor(defaultFontColor, for: .normal)
        btn9.setTitleColor(defaultFontColor, for: .normal)
        
        isSelected = false
    }
    
    func buttonSetup(){
        btn1.layer.cornerRadius = 8
        btn2.layer.cornerRadius = 8
        btn3.layer.cornerRadius = 8
        btn4.layer.cornerRadius = 8
        btn5.layer.cornerRadius = 8
        btn6.layer.cornerRadius = 8
        btn7.layer.cornerRadius = 8
        btn8.layer.cornerRadius = 8
        btn9.layer.cornerRadius = 8

    }
    
    func formatTime(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+7:00") //Current time zone
        
        guard let date = dateFormatter.date(from: bookingTime) else {
            fatalError()
        }
        print(date)
        
        bookingDate = date
    }
}

extension UserBookingVC: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        if let tempDate = calendar.selectedDate{
            selectedDate = tempDate
        }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
//        bookingDate = formatter.string(from: selectedDate)

    }
    
}

