import UIKit
import Foundation

struct Location {
    let x : Int
    let y : Int
}

struct DeliveryArea{
    let center : Location
    var radius : Double
    func contain(_ location : Location) -> Bool{
        let restaurentToCustomer = distance(from: center, to: location)
        return restaurentToCustomer < radius
    }
    
    func overlaps(with area : DeliveryArea) -> Bool{
        let centerToCenter = distance(from: center, to: area.center)
        return centerToCenter < radius + area.radius
    }
}

func distance(from source : Location,
              to target : Location) -> Double{
    let horizontalDistance = Double(source.x - target.x)
    let verticalDistance = Double(source.y - target.y)
    return (horizontalDistance * horizontalDistance +
        verticalDistance * verticalDistance).squareRoot()
}

func isInDeliveryRange(restaurent : DeliveryArea,
                       customer : Location) -> Bool{
    let restaurentToCustomer = distance(from: restaurent.center, to: customer)
    return restaurentToCustomer < restaurent.radius
}

let restaurent1 = DeliveryArea(center: Location(x: 10, y: 2), radius: 5)
let restaurent2 = DeliveryArea(center: Location(x: 5, y: 8), radius: 3)
let restaurent3 = DeliveryArea(center: Location(x: 10, y: 20), radius: 5)
let restaurent4 = DeliveryArea(center: Location(x: 20, y: 2), radius: 7)

if restaurent1.overlaps(with: restaurent2) {
    print("restaurent1 and restaurent2 is not overlaps")
}
else {
    print("restaurent1 and restaurent2 is overlaps")
}

let customer1 = Location(x: 9, y: 5)


if isInDeliveryRange(restaurent: restaurent1, customer: customer1){
    print("We can ship your order for free")
}
else{
    print("We can not ship your order for free")
}
