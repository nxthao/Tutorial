import UIKit

func makeIncrement(amount : Int) -> () -> Int{
    var total = 0
    func increment() -> Int{
        total += amount
        return total
    }
    return increment
}

var incrementByTen = makeIncrement(amount: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())
var incrementBySeven = makeIncrement(amount: 7)
print(incrementBySeven())
print(incrementBySeven())
print(incrementByTen())
