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

extension Record : Comparable{
    static func <(lhs : Record, rhs : Record) -> Bool{
        if lhs.wins == rhs.wins{
            return lhs.loses > rhs.loses
        }
        return lhs.wins < rhs.wins
    }
}

print(recordA < recordB)

print("Free function")
let recordC = Record(wins: 20, loses: 5)
let recordD = Record(wins: 10, loses: 15)
let recordE = Record(wins: 5, loses: 15)

var recordArray : [Record] = [recordA, recordB, recordC, recordD]

extension Record{
    static func Print(recordLeague : [Record]){
        for record in recordLeague{
            print("wins: \(record.wins), loses: \(record.loses)")
        }
    }
    static func Print(record : Record) -> String{
        "wins: \(record.wins), loses: \(record.loses)"
    }
}

Record.Print(recordLeague: recordArray)

print("After sorting")
recordArray.sort() // This sort is of "Comparable" protocol
Record.Print(recordLeague: recordArray)

let win = recordArray.max()
print("First price: \(Record.Print(record: win!))")

recordArray.starts(with: [recordA, recordC]) // false
recordArray.contains(recordE) // false
