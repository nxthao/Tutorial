import UIKit

print("Swap two value")

func swapValue<T>(a : inout T, b : inout T)
{
    let tmp : T = a
    a = b
    b = tmp
}

var intValue1 = 10
var intValue2 = 8
swapValue(a: &intValue1, b: &intValue2)
print("After swapping: intValue1: \(intValue1), intValue2: \(intValue2)")

var stringValue1 = "Nguyen"
var stringValue2 = "Thao"
swapValue(a: &stringValue1, b: &stringValue2)
print("After swapping: stringValue1: \(stringValue1), stringValue2: \(stringValue2)")


