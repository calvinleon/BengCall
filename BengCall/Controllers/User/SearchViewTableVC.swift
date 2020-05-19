//
//  SearchViewTableVC.swift
//  BengCall
//
//  Created by Setiawan Joddy on 17/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit
import MapKit

class SearchViewTableVC: UITableViewController {
    
    var matchItems: [MKMapItem] = []
    var userMapView: MKMapView? = nil
    
    var mapSearchHandlerDelegate: MapSearchHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - TABLE VIEW DATA SOURCE
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return matchItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        
        let selectedItem = matchItems[indexPath.row].placemark
        
        cell.textLabel?.text = selectedItem.name
        cell.detailTextLabel?.text = parseAddress(selectedItem: selectedItem)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = matchItems[indexPath.row].placemark
        mapSearchHandlerDelegate?.dropPinZoomIn(placemark: selectedItem)
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - METHODS FOR ADDRESS
    
    func parseAddress(selectedItem:MKPlacemark) -> String {
      // Put a space between "4" and "Melrose Place"
      let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil ) ? " " : ""
      // Put comma between street and city/state
      let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.subAdministrativeArea != nil) ? ", " : ""
      // Put a space between "Washington" and "DC"
      let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
      let addressLine = String(format: "%@%@%@%@%@%@%@",
                               // Street number
                               selectedItem.subThoroughfare ?? "",
                               firstSpace,
                               // Street name
                               selectedItem.thoroughfare ?? "",
                               comma,
                               // City
                               selectedItem.locality ?? "",
                               secondSpace,
                               // State
                               selectedItem.administrativeArea ?? ""
      )
      return addressLine
    }
}

    //MARK: - SEARCH CONTROLLER
extension SearchViewTableVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let mapView = userMapView,
            let searchBarText = searchController.searchBar.text else { return }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        search.start { (response, _) in
            guard let response = response else {
                return
            }
            self.matchItems = response.mapItems
            self.tableView.reloadData()
        }
    }
}
