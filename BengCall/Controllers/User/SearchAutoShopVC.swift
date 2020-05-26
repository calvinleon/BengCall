//
//  SearchAutoShopVC.swift
//  BengCall
//
//  Created by Calvin Leonardo on 08/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit


class SearchAutoShopVC: UITableViewController, UISearchResultsUpdating {
    
    var autoShop = AutoShop.fetchAutoShop()
    
    var filteredAutoShop = [AutoShop]()
    var resultSearchController = UISearchController()
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredAutoShop.removeAll(keepingCapacity: false)
        
        filteredAutoShop = searchController.searchBar.text!.isEmpty ? autoShop : autoShop.filter {
            $0.autoShopName.lowercased().contains(searchController.searchBar.text!.lowercased())
        }
        
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.searchBar.sizeToFit()               
            controller.obscuresBackgroundDuringPresentation = false

            tableView.tableHeaderView = controller.searchBar
               
            return controller
        })()
           
        tableView.reloadData()
    }

    func startSegue() {
          performSegue(withIdentifier: "autoshopDetailSegue", sender: self)
      }
      
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AutoShopDetailVC {
          
                
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  (resultSearchController.isActive) {
            return filteredAutoShop.count
        } else {
            return autoShop.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
           
        if (resultSearchController.isActive) {
            cell.textLabel?.text = filteredAutoShop[indexPath.row].autoShopName
            cell.detailTextLabel?.text = filteredAutoShop[indexPath.row].autoShopAddress
            return cell
        }
        else {
            cell.textLabel?.text = autoShop[indexPath.row].autoShopName
            cell.detailTextLabel?.text = autoShop[indexPath.row].autoShopAddress
            print(autoShop[indexPath.row])
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (resultSearchController.isActive){
               
        } else {
            
        }
        startSegue()

    }
}
