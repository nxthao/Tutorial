import UIKit
import Foundation

let restaurentLocation = (2, 10)
let restaurentRange : Double = 5

func distance(from source : (x : Int, y : Int),
              to target : (x : Int, y : Int)) -> Double {
    let horizontalDistance = Double(source.x - target.x)
    let verticalDistance = Double(source.y - target.y)
    return (horizontalDistance * horizontalDistance +
        verticalDistance * verticalDistance).squareRoot()
}

func isInDeliveryRange(customer : (x : Int, y : Int)) -> Bool{
    let customerToRestaurent = distance(from: customer, to: restaurentLocation)
    return customerToRestaurent < restaurentRange
}

if isInDeliveryRange(customer: (2,8)) {
    print("Delivery is free for this customer")
}
else{
    print("Delivery costs the fee for this customer")
}
