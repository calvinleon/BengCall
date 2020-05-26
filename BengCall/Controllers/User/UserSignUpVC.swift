//
//  UserSignUpVC.swift
//  BengCall
//
//  Created by Setiawan Joddy on 26/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit
import CoreData

class UserSignUpVC: UIViewController {
    
    var userSignUpTFContainer: UserSignUpTableVC?
    
    var tempUserName: String?
    var tempUserEmail: String?
    var tempUserPassword: String?
    var tempUserPhoneNumber: String?
    var tempUserMotorType: String?
    var tempUserLicenseNumber: String?
    var tempUserAddress: String?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func userSignUpButton(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let userSignUpTableVC = segue.destination as? UserSignUpTableVC, segue.identifier == "embedUserSignUp" {
            
            userSignUpTFContainer = userSignUpTableVC
        }
    }
}

//extension UserSignUpVC {
//
//    func updateData(sourceVC: OwnerSignUpTableVC?) {
//
//        guard let name = sourceVC?..text, name != "" else {
//        alertLogin(msg: "Name")
//        return }
//    }
//}
