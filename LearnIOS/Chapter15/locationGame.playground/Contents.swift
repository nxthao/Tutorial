import UIKit

enum Direction{
    case north
    case south
    case west
    case east
}

func Location(locationCharacter : [Direction]) -> (x : Int, y : Int){
    var currentLocation : (x : Int, y : Int) = (0, 0)
    for location in locationCharacter{
        switch location {
        case .north:
            currentLocation.y += 1
        case .south:
            currentLocation.y += -1
        case .east:
            currentLocation.x += 1
        case .west:
            currentLocation.x += -1
        }
    }
    return currentLocation
}

let character : [Direction] = [.north, .south,. north, .east, .east, .west, .south, .east, .south]
let currentLocation = Location(locationCharacter: character)
print("Current location of character: x: \(currentLocation.x), y: \(currentLocation.y)")
