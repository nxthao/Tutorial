//
//  ViewController.swift
//  MyMap
//
//  Created by Thao Nguyen on 10/14/20.
//

import UIKit
import CoreLocation
import CoreData

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
    
    var timer : Timer?
    
    // Core data
    var managedObjectContext : NSManagedObjectContext!
    var testString : String!

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
        
        var distance = CLLocationDistance(Double.greatestFiniteMagnitude)
        if let location = location{
            distance = newLocation.distance(from: location)
        }
        
        if location == nil || location!.horizontalAccuracy > newLocation.horizontalAccuracy{
            lastLocationError = nil
            location = newLocation
            if newLocation.horizontalAccuracy <= locationManager.desiredAccuracy{
                print("Done")
                stopLocationManager()
                if distance > 0 {
                    performingRevertGeocoding = false
                }
            }
            updateLabel()
            
            if !performingRevertGeocoding{
                print("Going to Geocoding")
                geocoder.reverseGeocodeLocation(newLocation, completionHandler: {
                    placeMarks, error in
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
        else if distance < 1{
            let timesInterval = newLocation.timestamp.timeIntervalSince(location!.timestamp)
            if timesInterval > 10{
                print("**** Force done")
                stopLocationManager()
                updateLabel()
            }
        }
    }
    
    func startLocationManager(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            updatingLocation = true
            
            timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(didTimeOut), userInfo: nil, repeats: false)
        }
    }
    
    func stopLocationManager(){
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
        updatingLocation = false
        if let timer = timer{
            timer.invalidate()
        }
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
            tagButton.isHidden = false
            messageLabel.text = ""
            
            if let placemark = placemark {
                addressLabel.text = string(from: placemark)
            }
            else if performingRevertGeocoding{
                addressLabel.text = "Searching for address"
            }
            else if lastGeocodingError != nil{
                addressLabel.text = "Error finding address"
            }
            else{
                addressLabel.text = "No address found"
            }
        }
        else{
            latitudeLabel.text = ""
            longitudeLabel.text = ""
            tagButton.isHidden = true
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
    
    // Convert placemark to string
    func string(from placemark : CLPlacemark) -> String{
        var line1 = ""
        if let s = placemark.subThoroughfare{
            line1 += s + " "
        }
        if let s = placemark.thoroughfare{
            line1 += s + " "
        }
        
        var line2 = ""
        if let s = placemark.locality{
            line2 += s + " "
        }
        if let s = placemark.administrativeArea{
            line2 += s + " "
        }
        if let s = placemark.postalCode{
            line2 += s + " "
        }
        return line1 + line2
    }
    
    @objc func didTimeOut(){
        print("Time out")
        if location == nil{
            stopLocationManager()
            lastLocationError = NSError(domain: "MyLocationErrorDomain", code: 1, userInfo: nil)
            updateLabel()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TagLocation" {
            let controller = segue.destination as! LocationDetailViewController
            controller.coordinate.latitude = location!.coordinate.latitude
            controller.coordinate.longitude = location!.coordinate.longitude
            controller.placemark = placemark
            
            if managedObjectContext != nil{
                print("managedObjectContext is not nil")
            }
            else{
                print("managedObjectContext is nil")
            }
            
            if testString != nil{
                print("testString: \(testString)")
            }
            else{
                print("teststring is nil")
            }
            
            // Assign data model to Location detail view controller
            controller.managedObjectContext = managedObjectContext
        }
    }
}

class SecondViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
