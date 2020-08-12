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
