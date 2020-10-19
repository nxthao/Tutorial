//
//  ViewController.swift
//  MyMap
//
//  Created by Thao Nguyen on 10/14/20.
//

import UIKit
import CoreLocation

class CurrentLocationViewController : UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var messageLabel : UILabel!
    @IBOutlet weak var latitudeLabel : UILabel!
    @IBOutlet weak var longitudeLabel : UILabel!
    @IBOutlet weak var addressLabel : UILabel!
    @IBOutlet weak var tagButton : UIButton!
    @IBOutlet weak var getButton : UIButton!
    
    let locationManager = CLLocationManager()
    let authstatus = CLLocationManager().authorizationStatus
    
    // location variable
    var location : CLLocation?
    var updatingLocation = false
    var lastLocationError : Error?
    
    // geocoding variable
    let geocoder = CLGeocoder()
    var placemark : CLPlacemark?
    var performingRevertGeocoding = false
    var lastGeocodingError : Error?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    // MARK:- Action
    @IBAction func getLocation(){
        if authstatus == .notDetermined{
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        if authstatus == .denied || authstatus == .restricted{
            showLocationServiceDeniedAlert()
            return
        }
        if updatingLocation{
            stopLocationManager()
        }
        else
        {
            location = nil
            lastLocationError = nil
            startLocationManager()
        }
        updateLabel()
    }
    
    // MARK:- CCLocationManager
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("did Fail with error \(error)")
        if (error as NSError).code == CLError.locationUnknown.rawValue{
            return
        }
        lastLocationError = error
        stopLocationManager()
        updateLabel()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        print("Did update new location \(newLocation)")
        
        if newLocation.timestamp.timeIntervalSinceNow < -5{
            return
        }
        if newLocation.horizontalAccuracy < 0{
            return
        }
        if location == nil || location!.horizontalAccuracy > newLocation.horizontalAccuracy{
            lastLocationError = nil
            location = newLocation
            if newLocation.horizontalAccuracy <= locationManager.desiredAccuracy{
                print("Done")
                stopLocationManager()
            }
        }
        updateLabel()
        
        if !performingRevertGeocoding{
            print("Going to Geocoding")
            geocoder.reverseGeocodeLocation(newLocation, completionHandler: {
                placeMarks, error in
//                if let error = error{
//                    print("Reverse geoding error \(error.localizedDescription)")
//                    return
//                }
//                if let places = placeMarks{
//                    print("Found place: \(places)")
                self.lastGeocodingError = error
                if error == nil, let p = placeMarks, !p.isEmpty{
                    self.placemark = p.last!
                }
                else{
                    self.placemark = nil
                }
                
                self.performingRevertGeocoding = true
                self.updateLabel()
                }
            )
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
    
    func stopLocationManager(){
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
        updatingLocation = false
    }
    
    // MARK:- Helper method
    func showLocationServiceDeniedAlert(){
        let alert = UIAlertController(
            title: "GPS service is disable",
            message: "Please turn on the GPS service in setting!",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        )
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func updateLabel(){
        if let location = location{
            latitudeLabel.text = String(format: "%0.8f", location.coordinate.latitude)
            longitudeLabel.text = String(format: "%0.8f", location.coordinate.longitude)
            tagButton.isHidden = true
            messageLabel.text = ""
        }
        else{
            latitudeLabel.text = ""
            longitudeLabel.text = ""
            tagButton.isHidden = false
            addressLabel.text = ""
            let statusMessage : String
            if let error = lastLocationError as NSError?{
                if error.domain == kCLErrorDomain &&
                    error.code == CLError.denied.rawValue{
                    statusMessage = "GPS service is disable"
                }
                else{
                    statusMessage = "Error getting location"
                }
            }
            else if !CLLocationManager.locationServicesEnabled(){
                statusMessage = "GPS service is disable"
            }
            else if updatingLocation{
                statusMessage = "Searching..."
            }
            else{
                statusMessage = "Please tab \"Get Location\" button!"
            }
            messageLabel.text = statusMessage
        }
        configureGetButton()
    }
    
    func configureGetButton(){
        if updatingLocation {
            getButton.setTitle("Stop", for: .normal)
        }
        else{
            getButton.setTitle("Get Location", for: .normal)
        }
    }

}

class SecondViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
