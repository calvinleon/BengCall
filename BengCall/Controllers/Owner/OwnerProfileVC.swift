//
//  OwnerProfileVC.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 07/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class OwnerProfileVC: UIViewController {

    @IBOutlet weak var ownerImageView: UIImageView!
    
    var owner = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        ownerImageView.layer.cornerRadius = 10
        ownerImageView.layer.masksToBounds = true
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
