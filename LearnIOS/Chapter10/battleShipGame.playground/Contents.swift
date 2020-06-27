import UIKit

struct Coordinate{
    var x_axis : Int
    var y_axis : Int
}

struct Ship{
    var shipCoordinate : Coordinate
    var direction : String // direction of the ship
    var length : Int // length of the ship
    
    func isHit(firingPosition : Coordinate) -> Bool {
        switch direction {
        // Direction of the ship is left
        case "letf":
            // Vertical is the same
            if shipCoordinate.y_axis == firingPosition.y_axis{
                if shipCoordinate.x_axis >= firingPosition.x_axis{
                    if shipCoordinate.x_axis - firingPosition.x_axis < length{
                        return true
                    }
                }
            }
        case "right":
            // Vertical is the same
            if shipCoordinate.y_axis == firingPosition.y_axis{
                if shipCoordinate.x_axis <= firingPosition.x_axis{
                    if firingPosition.x_axis - shipCoordinate.x_axis < length{
                        return true
                    }
                }
            }
        case "down":
            // Horizontal is the same
            if shipCoordinate.x_axis == firingPosition.x_axis{
                if shipCoordinate.y_axis >= firingPosition.y_axis{
                    if shipCoordinate.y_axis - firingPosition.y_axis < length{
                        return true
                    }
                }
            }
        case "up":
            // Horizontal is the same
            if shipCoordinate.x_axis == firingPosition.x_axis{
                if shipCoordinate.y_axis <= firingPosition.y_axis{
                    if firingPosition.y_axis - shipCoordinate.y_axis < length{
                        return true
                    }
                }
            }
        default:
            print("The direction is not supported")
        }
        return false
    }
}
if Ship(shipCoordinate: Coordinate(x_axis: 2, y_axis: 3), direction: "up", length: 5).isHit(firingPosition: Coordinate(x_axis: 2, y_axis: 5)){
    print("The ship is hit")
}
else{
    print("Miss the ship")
}
