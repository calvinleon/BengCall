//
//  AutoShop.swift
//  BengCall
//
//  Created by Calvin Leonardo on 07/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class AutoShop
{
    var autoShopName = ""
    var autoShopAddress = ""
    var autoShopDesc = ""
    var autoShopImg: UIImage
    
    init(autoShopName: String, autoShopAddress: String, autoShopDesc: String, autoShopImg: UIImage)
    {
        self.autoShopName = autoShopName
        self.autoShopAddress = autoShopAddress
        self.autoShopDesc = autoShopDesc
        self.autoShopImg = autoShopImg
    }
    
    // dummy data
    static func fetchAutoShop() -> [AutoShop]
    {
        return [
            AutoShop(autoShopName: "Bengkel AHASS XYZ", autoShopAddress: "Jl Kemanggisan", autoShopDesc: "Bengkel", autoShopImg: UIImage(named: "bengkel.png")!),
            AutoShop(autoShopName: "Bengkel AHASS Kosambi", autoShopAddress: "Jl Kosambi", autoShopDesc: "Bengkel", autoShopImg: UIImage(named: "bengkel.png")!),
            AutoShop(autoShopName: "Bengkel AHASS Meruya", autoShopAddress: "Jl Meruya", autoShopDesc: "Bengkel", autoShopImg: UIImage(named: "bengkel.png")!),
            AutoShop(autoShopName: "Bengkel AHASS Grogol", autoShopAddress: "Jl Grogol", autoShopDesc: "Bengkel", autoShopImg: UIImage(named: "bengkel.png")!),
        ]
    }
}
