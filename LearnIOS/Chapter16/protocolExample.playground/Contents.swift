import UIKit

protocol Vehicle{
    func accelerate()
    func stop()
}

protocol WheeledVehicle : Vehicle{
    var numbersOfWheel : Int { get}
    var wheelSize : Double {get set}
}

class Bike : Vehicle{
    var engine = false
    var brakesApplied = false
    
    func accelerate() {
        engine = true
        brakesApplied = false
    }
    
    func stop() {
        engine = false
        brakesApplied = true
    }
}

class AnotherBike : WheeledVehicle{
    var numbersOfWheel: Int = 2
    var wheelSize: Double = 20.00
    
    var engine = false
    var brakesApplied = false
    
    func accelerate() {
        engine = true
        brakesApplied = false
    }
    
    func stop() {
        engine = false
        brakesApplied = true
    }
}


print("Protocol in library standard")

class Record : Equatable{
    let wins : Int
    let loses : Int
    
    init(wins : Int, loses : Int) {
        self.wins = wins
        self.loses = loses
    }

    static func ==(lhs : Record, rhs : Record) -> Bool{
        lhs.wins == rhs.wins && lhs.loses == rhs.loses
    }
}

let recordA = Record(wins: 7, loses: 2)
let recordB = Record(wins: 7, loses: 2)
print(recordA == recordB)

extension Record{
    static func <(lhs : Record, rhs : Record) -> Bool{
        if lhs.wins == rhs.wins{
            return lhs.loses > rhs.loses
        }
        return lhs.wins < rhs.wins
    }
}

print(recordA < recordB)
let recordC = Record(wins: 10, loses: 5)



