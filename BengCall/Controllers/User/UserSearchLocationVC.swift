//
//  SearchLocationVC.swift
//  BengCall
//
//  Created by Setiawan Joddy on 07/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit
import MapKit

protocol MapSearchHandler {
    func dropPinZoomIn(placemark: MKPlacemark)
}

class UserSearchLocationVC: UIViewController {
    
    @IBOutlet weak var userMapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManagerSetup()
    }
    
//    //MARK: - SEARCH BAR
//    func searchLocationBarSetup() {
//
//
//    }

}

//MARK: - LOCATION MANAGER
extension UserSearchLocationVC: CLLocationManagerDelegate {
    
    func locationManagerSetup() {
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse {
            
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            userMapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    
}
