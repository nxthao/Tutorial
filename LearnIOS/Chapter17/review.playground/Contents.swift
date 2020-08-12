import UIKit

print("Review structure")

struct Coordinate{
    var x_axis : Int
    var y_axis : Int
}

struct Ship{
    var shipLocation : Coordinate
    var shipLength : Int
    var direction : String
    
    func isHit(firingLocation : Coordinate) -> Bool{
        switch direction {
        case "up":
            if shipLocation.x_axis == firingLocation.x_axis {
                if firingLocation.y_axis > shipLocation.y_axis &&
                    (firingLocation.y_axis - shipLocation.y_axis) < shipLength{
                    return true
                }
            }
        case "down":
            if shipLocation.x_axis == firingLocation.x_axis{
                if shipLocation.y_axis > firingLocation.y_axis &&
                    (shipLocation.y_axis - firingLocation.y_axis) < shipLength{
                    return true
                }
            }
        case "left":
            if shipLocation.y_axis == firingLocation.y_axis{
                if shipLocation.x_axis > firingLocation.x_axis && (shipLocation.x_axis - firingLocation.x_axis) < shipLength{
                    return true
                }
            }
        case "right":
            if shipLocation.y_axis == firingLocation.y_axis{
                if firingLocation.x_axis > shipLocation.y_axis && (firingLocation.x_axis - shipLocation.x_axis) < shipLength{
                    return true
                }
            }
        default:
            print("The direction is not supported.")
        }
        return false
    }
}

var shipIsBeaten = Ship(shipLocation: Coordinate(x_axis: 2, y_axis: 5), shipLength: 20, direction: "up").isHit(firingLocation: Coordinate(x_axis: 2, y_axis: 15))
if shipIsBeaten{
    print("Ship is beaten")
}
else{
    print("Miss the ship")
}


print("Review property with willset and didset.")

struct lightBulb{
    static var maxCurrent = 40
    var isOn = false
    var current : Int{
        willSet{
            if newValue > lightBulb.maxCurrent{
                print("The new current is high. To safe, the light will turn off!")
                self.isOn = false
                print("Please decrease the current!")
            }
        }
        didSet{
            if current > lightBulb.maxCurrent{
                print("The light bulb was broken!")
                print("Change the ligh bulb and change current to old value!")
                current = oldValue
            }
        }
    }
}
var light = lightBulb(isOn: true, current: 5)
print("The current: \(light.current)")
print("Status of the light: \(light.isOn)")
lightBulb.maxCurrent = 10
print("The current: \(light.current)")
print("Status of the light: \(light.isOn)")
light.current = 20
print("The current: \(light.current)")
print("Status of the light: \(light.isOn)")

