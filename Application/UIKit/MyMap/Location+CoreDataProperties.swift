//
//  Location+CoreDataProperties.swift
//  MyMap
//
//  Created by Thao Nguyen on 11/7/20.
//
//

import Foundation
import CoreData
import CoreLocation

extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var category: String
    @NSManaged public var date: Date
    @NSManaged public var latitude: Double
    @NSManaged public var locationDescription: String
    @NSManaged public var longitude: Double
    @NSManaged public var placemark: CLPlacemark?

}

extension Location : Identifiable {

}
