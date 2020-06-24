import UIKit
import Foundation

struct Location {
    let x : Int
    let y : Int
}

struct DeliveryArea{
    let center : Location
    var radius : Double
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
let customer1 = Location(x: 9, y: 5)

if isInDeliveryRange(restaurent: restaurent1, customer: customer1){
    print("We can ship your order for free")
}
else{
    print("We can not ship your order for free")
}

