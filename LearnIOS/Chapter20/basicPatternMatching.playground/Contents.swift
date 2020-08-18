import UIKit

func coordinate(point : (x : Int, y : Int, z : Int)) -> String{
    if case (0, 0, 0) = point{
        return "This is origin"
    }
    return "This is not origin"
}

let origin = coordinate(point: (0, 0, 0))
print(origin)

func coordinateApproximately(point : (x : Int, y : Int, z : Int)) -> String{
    let nextToArrange = -2...2
    let middleArrange = -5...5
    
    switch point {
    case (0,0,0):
        return "This is origin"
    case (nextToArrange, nextToArrange, nextToArrange):
        return "This is next origin"
    case (middleArrange, middleArrange, middleArrange):
        return "This is near origin"
    default:
        return "This is far from origin"
    }
}

let pointA = coordinateApproximately(point: (4, 4, 1))
print(pointA)

let list = [2, 4, 1, 5, 8, 2, 3, 7, 9]

for case 2 in list{
    print("The value has in list")
}
