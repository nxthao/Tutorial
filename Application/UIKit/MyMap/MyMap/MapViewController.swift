
//
//  MapViewController.swift
//  MyMap
//
//  Created by Thao Nguyen on 11/22/20.
//

import UIKit
import CoreData
import MapKit

class MapViewController : UIViewController{
    @IBOutlet weak var mapView : MKMapView!
    var locations = [Location]()
    
    var managedObjectContext : NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLocations()
    }
    
    // MARK: - Action
    @IBAction func showLocations(){
    }
    
    @IBAction func showUser(){
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
    }
    
    // MARK: - Helper method
    func updateLocations(){
        mapView.removeAnnotations(locations)
        let entity = Location.entity()
        let fetchRequest = NSFetchRequest<Location>()
        fetchRequest.entity = entity
        
        locations = try! managedObjectContext.fetch(fetchRequest)
        mapView.addAnnotations(locations)
    }
}

extension MapViewController : MKMapViewDelegate{
    
}
