import UIKit

infix operator ^^

func ^^(base : Double, power : Double) -> Double{
    pow(base, power)
}

let a = 10 ^^ 2
print("The power: \(a)")
