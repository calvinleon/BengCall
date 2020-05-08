//
//  SearchLocationVC.swift
//  BengCall
//
//  Created by Setiawan Joddy on 07/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class UserSearchLocationVC: UIViewController {

    @IBOutlet weak var userMapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 5000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationServices()
    }
    
    func setupLocationManager() {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            userMapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            setupLocationManager()
            checkLocationAuthorization()
        }
        else {
            //show alert to user to turn this on
        }
    }
    
    func checkLocationAuthorization() {
        
        switch CLLocationManager.authorizationStatus() {
            
        case .authorizedWhenInUse:
            userMapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            //Show an alert to users that they're restricted to turn on the location
            break
        case .denied:
            //Show alert instructing users to turn the Location Service ON
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    
}

extension UserSearchLocationVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //When the user's location updated
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        userMapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //When users change their own permissions
        checkLocationAuthorization()
    }
}
