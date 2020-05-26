//
//  InProgressTableVC.swift
//  BengCall
//
//  Created by Muhammad Arif Setyo Aji on 19/05/20.
//  Copyright © 2020 Calvin Leonardo. All rights reserved.
//

import UIKit

class InProgressTableVC: UITableViewController {
    
    var selectedCellIndexPath: IndexPath?
    let selectedCellHeight: CGFloat = 205.0
    let unselectedCellHeight: CGFloat = 125.0
    
    var BookingData = [
        BookingModel(bookingId: 0, name: "Jurrian van der Broek", bookingTime: "10.00 WIB", motorType: "Suzuki Smash", motorNumber: "AA 4359 YE", phoneNumber: "085640041243"),
        BookingModel(bookingId: 1, name: "Hector Mariano", bookingTime: "11.00 WIB", motorType: "Vario 110CC", motorNumber: "AA 1245 LN", phoneNumber: "085640041244"),
        BookingModel(bookingId: 2, name: "Babila Ebwêlê", bookingTime: "12.00 WIB", motorType: "Suzuki Smash", motorNumber: "AA 1246 LB", phoneNumber: "085640041245"),
        BookingModel(bookingId: 3, name: "Lubomir Dvorak", bookingTime: "13.00 WIB", motorType: "Suzuki Spin", motorNumber: "AA 4357 YE", phoneNumber: "085640041247"),
        BookingModel(bookingId: 4, name: "Muhammad Arif", bookingTime: "14.00 WIB", motorType: "Suzuki Smash", motorNumber: "AA 4359 YE", phoneNumber: "085640041243"),
        BookingModel(bookingId: 5, name: "Setyo Aji", bookingTime: "15.00 WIB", motorType: "Suzuki Smash", motorNumber: "AA 4359 YE", phoneNumber: "085640041243"),
        BookingModel(bookingId: 6, name: "Setiawan Joddy", bookingTime: "16.00 WIB", motorType: "Suzuki Smash", motorNumber: "AA 4359 YE", phoneNumber: "085640041243"),
        BookingModel(bookingId: 7, name: "Calvin Leonardo", bookingTime: "17.00 WIB", motorType: "Suzuki Smash", motorNumber: "AA 4359 YE", phoneNumber: "085640041243"),
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return BookingData.count
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCellIndexPath == indexPath {
            return selectedCellHeight
        }
        return unselectedCellHeight
    }
    
    @objc func deleteRows(_ sender: UIButton){
        let point = sender.convert(CGPoint.zero, to: tableView)
        
        guard let indexPath = tableView.indexPathForRow(at: point) else { return }
        
        let bookingItem = BookingData[indexPath.row]
        
        let alertTitle = "Progress Confirmation"
        let alertMessage = "Has the booking with name: \(bookingItem.name) been done? "

        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let notYetAction = UIAlertAction(title: "Not Yet", style: .cancel) { (cancel) in
            alert.dismiss(animated: true, completion: nil)
        }
        let doneAction = UIAlertAction(title: "Done", style: .default) { (action) in

            print("Booking ID:\(bookingItem.bookingId) with Name:\(bookingItem.name) has been Done!")

            self.BookingData.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .left)
            
            self.tableView.reloadData()
            
            self.selectedCellIndexPath = nil

        }
        alert.addAction(doneAction)
        alert.addAction(notYetAction)
        self.present(alert, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressCell", for: indexPath) as? InProgressCell else { return UITableViewCell() }
        
        
        let dataIndex = BookingData[indexPath.row]
        cell.setupInsideCell(bookingData: dataIndex)
        cell.delegate = self
        
        if let doneButton = cell.DoneButton {
            doneButton.addTarget(self, action: #selector(deleteRows(_:)), for: .touchUpInside)
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectedCellIndexPath != nil && selectedCellIndexPath == indexPath {
            selectedCellIndexPath = nil
        } else {
            selectedCellIndexPath = indexPath
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        if selectedCellIndexPath != nil {
            // This ensures, that the cell is fully visible once expanded
            tableView.scrollToRow(at: indexPath, at: .none, animated: true)
        }
                
        print("Cell \(indexPath.row) selected")
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension InProgressTableVC: InProgressCellDelegate {
    
}
