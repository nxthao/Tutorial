import UIKit

struct CircleArea{
    var radius : Double = 1.0
    var area : Double{
        get{
            Double.pi * radius * radius
        }
        // Calculate area after trippling area
        set{
            radius = Double(newValue / Double.pi).squareRoot()
        }
    }
    mutating func TrippleArea(){
        area *= 3
    }
}

var circleArea = CircleArea(radius: 2)
print("Area Cricle: \(circleArea.area)")
print("Tripple area: \(circleArea.TrippleArea())")
print("Area Cricle: \(circleArea.area)")
print("Radius after trippling area: \(circleArea.radius)")
