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
    var autoShopDesc = ""
    
    var autoShopServices = [String]()
    var autoShopPhoneNumber = ""
    var autoShopCapatiy = ""
    var autoShopImg: UIImage
    
    var autoShopLong = 0.0
    var autoShopLang = 0.0
    
    var distance = ""
    
    init(autoShopName: String, autoShopImg: UIImage, autoShopAddress: String, autoShopDesc: String, autoShopServices: [String], autoShopPhoneNumber: String, autoShopCapacity: String, distance: String)
    {
        self.autoShopName = autoShopName
        self.autoShopAddress = autoShopAddress
        self.autoShopImg = autoShopImg
        self.autoShopDesc = autoShopDesc
        self.autoShopServices = autoShopServices
        self.autoShopPhoneNumber = autoShopPhoneNumber
        self.autoShopCapatiy = autoShopCapacity
        self.distance = distance
    }
    
    
    static func fetchAutoShop() -> [AutoShop]
    {
        return [
//            AutoShop(autoShopName: "Agung Jaya Motor", autoShopImg: UIImage(named: "bengkel2.jpeg")!, autoShopAddress: "Jalan Danau Sunter Utara Blok B-1A No. 1, Sunter Agung Podomoro, RT.1/RW.10, Sunter Agung, Jakarta, North Jakarta City, Jakarta 14350", autoShopDesc: "We only give the best quality services at a reasonable price for our customers. We are one of the oldest motorcycle repair shops that have been around in North Jakarta.", autoShopServices: ["Oil Change", "Maintenance", "Parts Changing"], autoShopPhoneNumber: "02164715522", autoShopCapacity: "8 Mechanics"),
            
//            AutoShop(autoShopName: "Bengkel OMC", autoShopImg: UIImage(named: "bengkel3.jpeg")!, autoShopAddress: "Jl. Rw. Bebek II No.48, RT.16/RW.11, Penjaringan, Kec. Penjaringan, Kota Jkt Utara, Daerah Khusus Ibukota Jakarta 14440", autoShopDesc: "We are a small and privately owned motorcycle auto shop that’s been in the business for 20 years. We give our customers our all and they have never been disappointed by coming here.", autoShopServices: ["Oil Change", "Maintenance", "Parts Changing"], autoShopPhoneNumber: "081294044839", autoShopCapacity: "10 Mechanics"),
//
//            AutoShop(autoShopName: "Motor Suzuki Jakarta Utara", autoShopImg: UIImage(named: "bengkel4.jpeg")!, autoShopAddress: "Jl. Enggano No.84, RT.8/RW.16, Tj. Priok, Kota Jkt Utara, Daerah Khusus Ibukota Jakarta 14310", autoShopDesc: "We are an authorized Suzuki motorcycle service center. We specialize in Suzuki motorcycles only. Our mechanics are well trained and very knowledgeable about their work. People who come in for servicing are never let down because we want to give Suzuki a good name and to show the customers that we care about them.", autoShopServices: ["Oil Change", "Maintenance", "Parts Changing"], autoShopPhoneNumber: "02143933984", autoShopCapacity: "10 Mechanics"),
//
//            AutoShop(autoShopName: "Serba Jaya Motor", autoShopImg: UIImage(named: "bengkel5.png")!, autoShopAddress: "Jl Wahid Hasyim St No.58, RT.7/RW.5, Kebon Sirih, Menteng, Central Jakarta City, Jakarta 10340", autoShopDesc: "With more than 30 years experience (open in 1971), we have solved a lot of problems in motorcycle so that we brave to speak that we are expert in this. Let us solve your motorcycle problems too!", autoShopServices: ["Parts Changing", "Oil Changing", "Tune-Up", "Maintenance"], autoShopPhoneNumber: "+6285264889697", autoShopCapacity: "3 Mechanics"),
//            
//            AutoShop(autoShopName: "Sumber Jaya Motor", autoShopImg: UIImage(named: "bengkel6.png")!, autoShopAddress: "Jl. Palmerah Utara No.96 B, Palmerah, Kec. Palmerah, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11480", autoShopDesc: "We only accept competent mechanics that won’t make you wait too long and complain. We also provided guarantee for those who fix their motorcycle at Sumber Jaya Motor.", autoShopServices: ["Parts Changing", "Oil Changing", "Tune-Up", "Maintenance"], autoShopPhoneNumber: "+6285264889697", autoShopCapacity: "5 Mechanics"),
//            
//            AutoShop(autoShopName: "Motor Wonoz", autoShopImg: UIImage(named: "bengkel7.jpeg")!, autoShopAddress: "Jl. Kemanggisan Pulo No.51, RT.11/RW.17, Palmerah, Kec. Palmerah, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11480", autoShopDesc: "Bengkel Motor Wonoz accept all types of motorcycle. We have perfect and complete tools and machines to fix your motorcycle. ", autoShopServices: ["Oil Changing", "Tune-Up", "Maintenance"], autoShopPhoneNumber: "0212735031", autoShopCapacity: "6 Mechanics"),
//            
//            AutoShop(autoShopName: "Jiester Moto Shop", autoShopImg: UIImage(named: "bengkel8.png")!, autoShopAddress: "Jl. Panjang Arteri Klp. Dua No 5A & 5B, Kebon Jeruk, RT.2/RW.1, Kb. Jeruk, Kec. Kb. Jeruk, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11530", autoShopDesc: "We make your motorcycle prettier. Low price guaranteed, and we have big space to park. More than 1200 loyal customer has been believing us. Come book our service here so that you don’t need to wait!", autoShopServices: ["Oil Changing", "Tune-Up", "Maintenance", "Modification"], autoShopPhoneNumber: "+6281278229940", autoShopCapacity: "7 Mechanics"),
            
            AutoShop(autoShopName: "AHASS Anita Sejahtera", autoShopImg: UIImage(named: "bengkel10.jpeg")!, autoShopAddress: "Jl. Bouraq No.4, RT.001/RW.002, Karang Sari", autoShopDesc: "We are the biggest repairshop in Tangerang with more than 6 senior mechanics. We promised to repair our customer’s motorcycle with all our heart. The waiting room is big enough so you dont have to worry about the crowd.", autoShopServices: ["Parts changing", "Oil Changing", "Showroom", "Maintenance"], autoShopPhoneNumber: "02155733748", autoShopCapacity: "10 Mechanics", distance: "~ 3.3 Km"),
            
            AutoShop(autoShopName: "AHASS Omega Motor", autoShopImg: UIImage(named: "bengkel9.jpeg")!, autoShopAddress: "Jl. KH Hasyim Ashari No.44", autoShopDesc: "We offer you the best service in town with a good facilities. AC waiting room And TV that plays box office movies will make you lost track in time. We also serve a free drink and snacks.", autoShopServices: ["Parts Changing", "Oil Changing", "Tune-Up"], autoShopPhoneNumber: "0215549915", autoShopCapacity: "8 Mechanics", distance: "~ 5.0 Km"),

            AutoShop(autoShopName: "AHASS Festival Motor", autoShopImg: UIImage(named: "bengkel11.jpeg")!, autoShopAddress: "Jl. Imam Bonjol, RT.002/RW.003, Karawaci", autoShopDesc: "We offer you the best riding experience. We have 8 mechanics that are awarded by the HONDA MECHANICS Awards every year. your motorcycle is in the right hand.", autoShopServices: ["Parts Changing", "Oil Changing", "Maintenance"], autoShopPhoneNumber: "02155799543", autoShopCapacity: "8 Mechanics", distance: "~ 7.7 Km"),
            
            AutoShop(autoShopName: "AHASS Delima Motor", autoShopImg: UIImage(named: "bengkel12.jpeg")!, autoShopAddress: "Jl. Curug No.22, RT.001/RW.002, Babakan", autoShopDesc: "Since 2006, we consistently serve with the best service we can offer. The strategic place makes our repairshop always filled with customers. Best service guaranteed", autoShopServices: ["Parts Changing", "Oil Changing", "Maintenance"], autoShopPhoneNumber: "0215981637", autoShopCapacity: "5 Mechanics", distance: "~ 10.0 Km"),
           
        ]
    }
}

