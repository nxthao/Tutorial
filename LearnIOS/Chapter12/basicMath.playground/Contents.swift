import UIKit

struct Math{
    var number : Int = 1
    
    func factorial() -> Int{
        (1...self.number).reduce(1, *)
    }
}

extension Math{
    func add() -> Int{
        (1...self.number).reduce(0, +)
    }
}

let result = Math(number: 5)
print("Factorial of \(result.number): \(result.factorial())")
print("Calculate the total of the serial number from 1 to \(result.number): \(result.add())")
