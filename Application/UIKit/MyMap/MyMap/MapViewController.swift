
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
        if !locations.isEmpty{
            showLocations()
        }
    }
    
    // MARK: - Action
    @IBAction func showLocations(){
        let theRegion = region(for: locations)
        mapView.setRegion(theRegion, animated: true)
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
    
    func region(for annotaions : [MKAnnotation]) -> MKCoordinateRegion{
        let region : MKCoordinateRegion
        
        switch annotaions.count {
            case 0:
                region = MKCoordinateRegion(
                    center: mapView.userLocation.coordinate,
                    latitudinalMeters: 1000,
                    longitudinalMeters: 1000
                )
            case 1:
                let annotation = annotaions[annotaions.count - 1]
                region = MKCoordinateRegion(
                    center: annotation.coordinate,
                    latitudinalMeters: 1000,
                    longitudinalMeters: 1000
                )
            default:
                var topLeft = CLLocationCoordinate2D(latitude: -90, longitude: 180)
                var bottomRight = CLLocationCoordinate2D(latitude: 90, longitude: -180)
                
                for annotation in annotaions{
                    topLeft.latitude = max(topLeft.latitude, annotation.coordinate.latitude)
                    topLeft.longitude = min(topLeft.longitude, annotation.coordinate.longitude)
                    bottomRight.latitude = min(bottomRight.latitude, annotation.coordinate.latitude)
                    bottomRight.longitude = max(bottomRight.longitude, annotation.coordinate.longitude)
                }
                
                let center = CLLocationCoordinate2D(
                    latitude: topLeft.latitude - (topLeft.latitude - bottomRight.latitude)/2,
                    longitude: topLeft.longitude - (topLeft.longitude - bottomRight.longitude)/2
                )
                
                let extraSpace = 1.1
                
                let span = MKCoordinateSpan(
                    latitudeDelta: abs(topLeft.latitude - bottomRight.latitude) * extraSpace,
                    longitudeDelta: abs(topLeft.longitude - bottomRight.longitude) * extraSpace
                )
                region = MKCoordinateRegion(center: center, span: span)
        }
        return mapView.regionThatFits(region)
    }
}

extension MapViewController : MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)
    -> MKAnnotationView? {
        guard annotation is Location else {
            return nil
        }
        let identifier = "Location"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil{
            let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            pinView.isEnabled = true
            pinView.canShowCallout = true
            pinView.animatesDrop = false
            pinView.pinTintColor = UIColor(red: 0.32, green: 0.82, blue: 0.4, alpha: 1)
            
            let rightButton = UIButton(type: .detailDisclosure)
            rightButton.addTarget(self, action: #selector(showLocationDetails(_ : )), for: .touchUpInside)
            pinView.rightCalloutAccessoryView = rightButton
            
            annotationView = pinView
        }
        
        if let annotationView = annotationView{
            annotationView.annotation = annotation
            
            let button = annotationView.rightCalloutAccessoryView as! UIButton
            
            if let index = locations.firstIndex(of: annotation as! Location){
                button.tag = index
            }
        }
        return annotationView
    }
}
