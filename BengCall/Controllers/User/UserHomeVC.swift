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

    
    var autoShopName = ""
    var tempName = ""

    
    var autoShops = AutoShop.fetchAutoShop()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let cellWidth = 330
//        let cellHeight = 434
//        let insetX = (view.bounds.width - CGFloat(cellWidth)) / 2.0
//        let insetY = (view.bounds.height - CGFloat(cellHeight)) / 2.0
//
//        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
//        collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
//        
        collectionView.dataSource = self
        collectionView.delegate = self

    }
    
    func startSegue() {
        performSegue(withIdentifier: "autoshopDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AutoShopDetailVC {
        
            destination.autoshopName = tempName
            
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
        
            startSegue()
            
       }
    }
}


