//
//  LocationDetailViewController.swift
//  MyMap
//
//  Created by Thao Nguyen on 10/22/20.
//

import UIKit
import CoreLocation
import CoreData

private let dateFormatter : DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    print("formatter")
    return formatter
}()

class LocationDetailViewController: UITableViewController {
    
    typealias CLLocationDegrees = Double
    
    struct CLLocationCoordinate2D {
        var latitude : CLLocationDegrees
        var longitude : CLLocationDegrees
    }
    
    // Local variable
    var coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var placemark : CLPlacemark?
    let numberOfRowAtSection = [2, 1, 4]
    var categoryName = "No Category"
    var date = Date()
    
    // Core data variable
    var managedObjectContext : NSManagedObjectContext!
    
    // Outet variable
    @IBOutlet weak var descriptionTextView : UITextView!
    @IBOutlet weak var categoryLabel : UILabel!
    @IBOutlet weak var latitudeLabel : UILabel!
    @IBOutlet weak var longitudeLabel : UILabel!
    @IBOutlet weak var addressLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.text = ""
        categoryLabel.text = categoryName
        latitudeLabel.text = String(format: "%.8f", coordinate.latitude)
        longitudeLabel.text = String(format: "%.8f", coordinate.longitude)
        
        if let placemark = placemark{
            addressLabel.text = string(from: placemark)
        }
        else{
            addressLabel.text = "No address"
        }

        dateLabel.text = format(date: date)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gestureRecognizer.cancelsTouchesInView = false
        tableView.addGestureRecognizer(gestureRecognizer)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows = 0
        if section < numberOfRowAtSection.count{
            rows = numberOfRowAtSection[section]
        }
        return rows
    }

    // MARK:- Actions
    @IBAction func done(){
        let hudView = HudView.hud(inView: navigationController!.view, animated: true)
        hudView.text = "Tagged"
        
        let location = Location(context: managedObjectContext)
        location.locationDescription = descriptionTextView.text
        location.category = categoryName
        location.latitude = coordinate.latitude
        location.longitude = coordinate.longitude
        location.date = date
        location.placemark = placemark
        
        do {
            try managedObjectContext.save()
            let delayInSeconds = 1.0
            afterDelay(delayInSeconds){
                hudView.hide()
                self.navigationController?.popViewController(animated: true)
            }
        }catch{
            fatalError("Error \(error)")
        }
        
    }
    
    @IBAction func cancel(){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func categoryPickerDidPickCategory(_ segue : UIStoryboardSegue){
        let controller = segue.source as! CategoryPickerViewController
        categoryName = controller.selectedCategoryName
        categoryLabel.text = categoryName
    }
    
    // MARK:- Helper methods
    func string(from placemark : CLPlacemark) -> String{
        var text = " "
        if let s = placemark.subThoroughfare{
            text += s + " "
        }
        if let s = placemark.thoroughfare{
            text += s + ", "
        }
        if let s = placemark.locality{
            text += s + ", "
        }
        if let s = placemark.administrativeArea{
            text += s + ", "
        }
        if let s = placemark.postalCode{
            text += s + ", "
        }
        if let s = placemark.country{
            text += s + ", "
        }
        return text
    }
    
    func format(date : Date) -> String{
        return dateFormatter.string(from: date)
    }
    
    @objc func hideKeyboard(_ gestureReconizer : UIGestureRecognizer){
        let point = gestureReconizer.location(in: tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        if indexPath != nil && indexPath!.section == 0 && indexPath!.row == 0{
            return
        }
        descriptionTextView.resignFirstResponder()
    }
    
    // MARK:- table view
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 0 || indexPath.section == 1{
            return indexPath
        }
        else{
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            descriptionTextView.becomeFirstResponder()
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickCategory"{
            let controller = segue.destination as! CategoryPickerViewController
            controller.selectedCategoryName = categoryName
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
