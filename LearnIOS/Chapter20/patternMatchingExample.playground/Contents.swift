import UIKit

print("Enumeration case pattern")
enum Pet{
    case cat(legs : Int)
    case bird(legs : Int)
}

let animal = Pet.bird(legs: 2)
switch animal{
case .cat(let legs):
    print("The cat has \(legs) legs)")
case .bird(let legs):
    print("The bird has \(legs) legs")
}


print("Value-binding pattern")
let pointA = (5, 2, 0)

if case (let x, let y, 0) = pointA{
    print("pointA is on x-axis: \(x)")
    print("pointA is on y-axis: \(y)")
}


print("Is type-casting pattern")
let jsonContents : [Any] = [15, "Thao Nguyen", 20.0, animal]

for element in jsonContents{
    switch element {
    case is String:
        print("\(element) is String")
    case is Int:
        print("\(element) is Integer")
    case is Pet:
        print("\(element) is pet enum")
    case is Double:
        print("\(element) is Double")
    default:
        print("\(element) with it's type is not supported")
    }
}


print("As type-casting pattern")
for element in jsonContents{
    switch element {
    case let text as String:
        print("\(text) is String")
    case let text as Int:
        print("\(text) is Integer")
    case let text as Pet:
        print("\(text) is pet enum")
    case let text as Double:
        print("\(text) is Double")
    default:
        print("\(element) with it's type is not supported")
    }
}
