//
//  UserVC.swift
//  BengCall
//
//  Created by Calvin Leonardo on 07/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class UserHomeVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchView: UIButton!
    
    var tempName = ""
    var tempDesc = ""
    var tempAdress = ""
    var tempService = [String]()
    var tempImg = UIImage()
    var tempPhoneNumber = ""
    
    var tempDistance = ""
    
    var autoShops = AutoShop.fetchAutoShop()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.dataSource = self
        collectionView.delegate = self

        searchView.layer.cornerRadius = 8
    }
    
    func startSegue() {
        performSegue(withIdentifier: "autoshopDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AutoShopDetailVC {
        
            destination.autoshopName = tempName
            destination.autoshopAdress = tempAdress
            destination.autoshopImg = tempImg
            destination.autoshopDesc = tempDesc
            destination.autoshopService = tempService
            destination.autoshopPhoneNumber = tempPhoneNumber
            destination.distance = tempDistance
            
        }
    }
}

extension UserHomeVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return autoShops.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AutoShopCVCell", for: indexPath) as! AutoshopCollectionVC
        let autoShop = autoShops[indexPath.item]
        
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        cell.autoShop = autoShop
            
        return cell
    }
}

extension UserHomeVC: UIScrollViewDelegate, UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWithIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWithIncludingSpacing
        let roundIndex = round(index)
        
        offset = CGPoint(x: roundIndex * cellWithIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        
        targetContentOffset.pointee = offset
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.collectionView)
       let indexPath = self.collectionView.indexPathForItem(at: location)
        
       if let tempIndex = indexPath {
          print("Got clicked on index: \(tempIndex)!")
        
            let autoshop = autoShops[tempIndex.item]
            tempName = autoshop.autoShopName
            tempAdress = autoshop.autoShopAddress
            tempImg = autoshop.autoShopImg
            tempDesc = autoshop.autoShopDesc
            tempService = autoshop.autoShopServices
            tempPhoneNumber = autoshop.autoShopPhoneNumber
            tempDistance = autoshop.distance
            
            startSegue()
            
       }
    }
}


