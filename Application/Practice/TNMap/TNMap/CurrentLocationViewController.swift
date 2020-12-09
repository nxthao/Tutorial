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
    
    // Error handling properties
    var updatingLocation = false
    var lastLocationError : Error?
    
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
        
        startLocationManager()
        updateLabels()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error.localizedDescription)")
        
        if (error as NSError).code == CLError.locationUnknown.rawValue{
            return
        }
        lastLocationError = error
        stopLocationManager()
        updateLabels()
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
            let statusMessage : String
            if let error = lastLocationError as NSError? {
                if error.domain == kCLErrorDomain &&
                    error.code == CLError.denied.rawValue {
                    statusMessage = "Location Services Disabled"
                } else {
                    statusMessage = "Error Getting Location"
                }
            } else if !CLLocationManager.locationServicesEnabled() {
                statusMessage = "Location Services Disabled"
            } else if updatingLocation {
                statusMessage = "Searching..."
            } else {
                statusMessage = "Tap ’Get My Location’ to Start"
            }
            message.text = statusMessage
        }
    }
    
    // MARK: - Location Manager
    func stopLocationManager(){
        if updatingLocation{
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            updatingLocation = false
        }
    }
    
    func startLocationManager(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            updatingLocation = true
        }
    }
}

