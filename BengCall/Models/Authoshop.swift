//
//  Authoshop.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 08/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class AutoShop
{
    var autoShopName = ""
    var autoShopAddress = ""
    var autoShopImg: UIImage
    
    init(autoShopName: String, autoShopImg: UIImage, autoShopAddress: String)
    {
        self.autoShopName = autoShopName
        self.autoShopAddress = autoShopAddress
        self.autoShopImg = autoShopImg
    }
    
    
    static func fetchAutoShop() -> [AutoShop]
    {
        return [
            AutoShop(autoShopName: "Bengkel AHASS 1", autoShopImg: UIImage(named: "bengkel.png")!, autoShopAddress: "Jl Maju Jaya"),
            AutoShop(autoShopName: "Bengkel AHASS 2", autoShopImg: UIImage(named: "bengkel.png")!, autoShopAddress: "Jl Maju Jaya"),
            AutoShop(autoShopName: "Bengkel AHASS 3", autoShopImg: UIImage(named: "bengkel.png")!, autoShopAddress: "Jl Maju Jaya"),
            AutoShop(autoShopName: "Bengkel AHASS 4", autoShopImg: UIImage(named: "bengkel.png")!, autoShopAddress: "Jl Maju Jaya"),
        ]
    }
}

