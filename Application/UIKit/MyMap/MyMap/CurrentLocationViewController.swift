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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    
    // MARK:- CCLocationManager
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("did Fail with error \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        print("Did update new location \(newLocation)")
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
}

class SecondViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
