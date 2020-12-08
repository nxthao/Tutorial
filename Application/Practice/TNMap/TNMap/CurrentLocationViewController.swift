//
//  CurrentLocationViewController.swift
//  TNMap
//
//  Created by Thao Nguyen on 03/12/2020.
//

import UIKit
import CoreLocation

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate{

    // Outlet properties
    @IBOutlet weak var message : UILabel!
    @IBOutlet weak var latitudeValue : UILabel!
    @IBOutlet weak var longitudeValue : UILabel!
    @IBOutlet weak var address : UILabel!
    @IBOutlet weak var tagButton : UIButton!
    @IBOutlet weak var getButton : UIButton!
    
    // Properties
    let locationManager = CLLocationManager()
    
    var location : CLLocation?
    
    // Action
    @IBAction func getLocation(){
        // Ask permission
        let authStatus = CLLocationManager().authorizationStatus
        
        if authStatus == .notDetermined{
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        if authStatus == .denied || authStatus == .restricted{
            showLocationServicesDeniesAlert()
            return
        }
        
        // Recieve location
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        print("didUpdateLocations: \(newLocation)")
        
        location = newLocation
        updateLabels()
    }
    
    // MARK: - Helper methods
    func showLocationServicesDeniesAlert(){
        let alert = UIAlertController(title: "Location service is disable", message: "Please enable location service in setting", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    func updateLabels(){
        if let location = location{
            latitudeValue.text = String(format: "%0.8f", location.coordinate.latitude)
            longitudeValue.text = String(format: "%0.8f", location.coordinate.longitude)
            tagButton.isHidden = false
            message.text = ""
        }
        else{
            latitudeValue.text = ""
            longitudeValue.text = ""
            tagButton.isHidden = true
            message.text = "Please Tap 'Get Location' button"
        }
    }
}

