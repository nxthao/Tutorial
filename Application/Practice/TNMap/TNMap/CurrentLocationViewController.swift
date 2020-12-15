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
    
    // Revert geocoding
    var geocoder = CLGeocoder()
    var placemark : CLPlacemark?
    var performingReverseGeocoding = false
    var lastGeocodingError : Error?
    
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
        
        if updatingLocation{
            stopLocationManager()
        }
        else {
            location = nil
            lastLocationError = nil
            startLocationManager()
        }
        
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
        
        if newLocation.timestamp.timeIntervalSinceNow < -5{
            return
        }
        if newLocation.horizontalAccuracy < 0 {
            return
        }
        
        if location == nil || location!.horizontalAccuracy > newLocation.horizontalAccuracy{
            lastLocationError = nil
            location = newLocation
            
            if newLocation.horizontalAccuracy <= locationManager.desiredAccuracy{
                print("We done!")
                stopLocationManager()
            }
        }
        
        if !performingReverseGeocoding{
            print("Start to geocode!")
            performingReverseGeocoding = true
            geocoder.reverseGeocodeLocation(newLocation, completionHandler: {
                placemarks, error in
                self.lastGeocodingError = error
                if error == nil, let p = placemarks, !p.isEmpty{
                    self.placemark = p.last!
                }
                else{
                    self.placemark = nil
                }
                self.performingReverseGeocoding = false
                self.updateLabels()
            })
        }
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
            if let placemark = placemark{
                address.text = string(from: placemark)
            } else if performingReverseGeocoding{
                address.text = "Searching for address"
            } else if lastGeocodingError != nil{
                address.text = "Error when finding location"
            }
            else{
                address.text = "No address"
            }
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
        configureGetButton()
    }
    
    func configureGetButton(){
        if updatingLocation{
            getButton.setTitle("Stop", for: .normal)
        }
        else {
            getButton.setTitle("Get My location", for: .normal)
        }
    }
    
    func string(from placemark : CLPlacemark) -> String{
        var line1 = ""
        if let s = placemark.subThoroughfare{
            line1 += s + " "
        }
        if let s = placemark.thoroughfare{
            line1 += s
        }
        
        var line2 = ""
        if let s = placemark.locality{
            line2 += s + " "
        }
        if let s = placemark.administrativeArea{
            line2 += s + " "
        }
        if let s = placemark.postalCode{
            line2 += s
        }
        
        return line1 + "\n" + line2
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
            placemark = nil
            lastGeocodingError = nil
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            updatingLocation = true
        }
    }
    
}

