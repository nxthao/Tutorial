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
    @IBOutlet weak var latitude : UILabel!
    @IBOutlet weak var latitudeValue : UILabel!
    @IBOutlet weak var longitude : UILabel!
    @IBOutlet weak var longitudeValue : UILabel!
    @IBOutlet weak var address : UILabel!
    
    // Properties
    let locationManager = CLLocationManager()
    
    // Action
    @IBAction func getLocation(){
        // Ask permission
        let authStatus = CLLocationManager().authorizationStatus
        
        if authStatus == .notDetermined{
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        // Recieve location
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        print("didUpdateLocations: \(newLocation)")
    }
    
    // MARK: - Helper methods
    func showLocationServicesDeniesAlert(){
        
    }

    func updateLabel(){
            
    }
}

