import UIKit

struct Fruit{
    var nameFruit : String
    var weight : Int
}

var apples : [Fruit] = []
var oranges : [Fruit] = []
var pears : [Fruit] = []

func collectFruit(fruitFarm : [Fruit]) -> Int?{
    guard fruitFarm.count > 0 else{
        return nil
    }
    var totalWeight = 0
    for fruit in fruitFarm{
        switch fruit.nameFruit {
        case "apple":
            apples.append(fruit)
        case "orange":
            oranges.append(fruit)
        case "pear":
            pears.append(fruit)
        default:
            print("This fruit is not supported")
        }
        totalWeight += fruit.weight
    }
    return totalWeight
}

let truck = [
    Fruit(nameFruit: "apple", weight: Int.random(in: 50...100)),
    Fruit(nameFruit: "orange", weight: Int.random(in: 50...100)),
    Fruit(nameFruit: "apple", weight: Int.random(in: 50...100)),
    Fruit(nameFruit: "apple", weight: Int.random(in: 50...100)),
    Fruit(nameFruit: "pear", weight: Int.random(in: 50...100)),
    Fruit(nameFruit: "pear", weight: Int.random(in: 50...100)),
    Fruit(nameFruit: "orange", weight: Int.random(in: 50...100)),
    Fruit(nameFruit: "orange", weight: Int.random(in: 50...100)),
    Fruit(nameFruit: "apple", weight: Int.random(in: 50...100)),
    Fruit(nameFruit: "apple", weight: Int.random(in: 50...100)),
    Fruit(nameFruit: "orange", weight: Int.random(in: 50...100))
]

if let fruitWeight = collectFruit(fruitFarm: truck) {
    print("The total weight of fruit:\t \(fruitWeight) grams")
    print("apples are in facility:\t \(apples.count)")
    print("oranges are in facility:\t \(oranges.count)")
    print("pears are in facility:\t \(pears.count)")
}
