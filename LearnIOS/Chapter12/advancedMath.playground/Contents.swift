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
print("The factorial: \(result.factorial())")
print("Total: \(result.add())")

// Advanced of the Math is isEven and isOdd

extension Math{
    func isEven() -> Bool {
        if self.number % 2 == 0{
            return true
        }
        else{
            return false
        }
    }
}

extension Math{
    func isOdd() -> Bool {
        if self.number % 2 != 0{
            return true
        }
        else{
            return false
        }
    }
}

let numberEvenOdd = Math(number: 10)
print("Is \(numberEvenOdd.number) even? \(numberEvenOdd.isEven())")
print("Is \(numberEvenOdd.number) odd? \(numberEvenOdd.isOdd())")
