import UIKit

print("TV properties")

struct TV{
    var height : Double
    var width : Double
    
    var diagonal : Int{
        let result = (height * height + width * width).squareRoot().rounded()
        return Int(result)
    }
}
let diagonalTV = TV(height: 22, width: 30).diagonal
print("Diagonal of TV: \(diagonalTV) cm")


print("Type property and property observers")
struct Level{
    static var highestLevel = 1
    var id : Int
    let boss : String
    
    var unlocked : Bool{
        // didset is only called when unlocked is set, Note: it will not be called when unlocked is set in initialization
        didSet{
            if unlocked{
                if unlocked && Self.highestLevel < id{
                    Self.highestLevel = id
                }
            }
        }
    }
}

var level1 = Level(id: 1, boss: "Thao", unlocked: true)
var level2 = Level(id: 2, boss: "Nguyen", unlocked: false)
var level3 = Level(id: 3, boss: "Dao", unlocked: false)
var level4 = Level(id: 4, boss: "Hieu", unlocked: false)

level4.unlocked = true
let highestLevel = Level.highestLevel
print("Highest level: \(highestLevel)")


print("LightBulb in limiting a variable")

struct LightBulb{
    static var maxCurrent = 40
    var current = 0 {
        didSet{
            if current > LightBulb.maxCurrent{
                print("The current is so high, need to call back to old current")
                current = oldValue
            }
        }
    }
}

var light1 = LightBulb()
light1.current = 50
print("The current is \(light1.current)")


