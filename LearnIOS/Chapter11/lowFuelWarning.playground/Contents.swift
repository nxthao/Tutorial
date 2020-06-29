import UIKit

struct FuelTank{
    var lowFuel : Bool = false
    var level : Double = 0.5// decimal percentage between 0 and 1
        {
        didSet{
            if level < 0.1{
                lowFuel = true
            }
            else{
                lowFuel = false
            }
        }
    }
}

struct Car{
    var make : String
    var color : String
    var fuelTank : FuelTank
}

var car = Car(make: "Mercedes", color: "Grey", fuelTank: FuelTank())
print("Fuel status of \(car.make) is \(car.fuelTank.lowFuel)")
car.fuelTank.level = 0.05
print("Fuel status of \(car.make) is \(car.fuelTank.lowFuel)")
print("The color of my \(car.make) is \(car.color)")
