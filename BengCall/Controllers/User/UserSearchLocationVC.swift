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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBOutlet weak var userMapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var resultSearchController: UISearchController? = nil
    
    var selectedPin: MKPlacemark? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManagerSetup()
        searchLocationBarSetup()
    }
    
    func getDirections() {
        
        if let selectedPin = selectedPin {
            let mapItem = MKMapItem(placemark: selectedPin)
            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
            mapItem.openInMaps(launchOptions: launchOptions)
        }
    }
    
    //MARK: - SEARCH BAR
    func searchLocationBarSetup() {
        
        let searchViewTable = storyboard!.instantiateViewController(identifier: "SearchViewTableVC") as! SearchViewTableVC
        searchViewTable.mapSearchHandlerDelegate = self
        
        resultSearchController = UISearchController(searchResultsController: searchViewTable)
        resultSearchController?.searchResultsUpdater = searchViewTable
        
        //Embeds SearchBar on the NavBar
        let searchBar = resultSearchController?.searchBar
        searchBar?.sizeToFit()
        searchBar?.placeholder = "Search for Repair Shops"
        navigationItem.titleView = resultSearchController?.searchBar
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        
        searchViewTable.userMapView = userMapView
    }
    
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
        print(error)
    }
}

//MARK: - MAP SEARCH HANDLER
extension UserSearchLocationVC: MapSearchHandler {
    func dropPinZoomIn(placemark: MKPlacemark) {
        selectedPin = placemark
        userMapView.removeAnnotations(userMapView.annotations)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality, let state = placemark.administrativeArea {
            
            annotation.subtitle = "\(city), \(state)"
        }
        userMapView.addAnnotation(annotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
        userMapView.setRegion(region, animated: true)
        
    }
}

//MARK: - MKMAPViewDelegate
extension UserSearchLocationVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseID = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID) as? MKPinAnnotationView
        pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
        pinView?.pinTintColor = UIColor.red
        pinView?.canShowCallout = true
        
        return pinView
    }
}
