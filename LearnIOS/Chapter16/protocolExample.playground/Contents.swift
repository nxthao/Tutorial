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
