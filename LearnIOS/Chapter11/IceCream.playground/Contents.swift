import UIKit

struct IceCream{
    let name : String = "Chocolate"
    lazy var ingredients : [String] = {
        ["Cream", "Chocolate", "Milk", "Coffee", "Sugar"]
    }()
}

var iceCream = IceCream()
// It is not still initialized yet.
iceCream.ingredients.append("Coconut")
// ingredients initilized before appending
print(iceCream.ingredients)
