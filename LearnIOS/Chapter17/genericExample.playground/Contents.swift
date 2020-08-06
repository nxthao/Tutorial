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


print("Generic type")

struct Stack<Type>{
    var items : [Type]
    mutating func push(item : Type) -> [Type]{
        items.append(item)
        return items
    }
    
    mutating func pop() -> [Type]{
        items.removeLast()
        return items
    }
}

var emptyString : [String] = []
var stackString = Stack<String>(items: emptyString)
stackString.push(item: "Thao")
stackString.push(item: "Nguyen")
stackString.push(item: "Dao")
stackString.push(item: "Hieu")
print("Current Stack: \(stackString.items)")
stackString.push(item: "A")
print("Current Stack: \(stackString.items)")
stackString.pop()
print("Stack after poping: \(stackString.items)")



