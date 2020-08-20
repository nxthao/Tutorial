import UIKit

struct Pet{
    let numberOfLegs : Int
    
    init?(numberOfLegs : Int) {
        if numberOfLegs < 0{
            return nil
        }
        self.numberOfLegs = numberOfLegs
    }
}

let dog = Pet(numberOfLegs: 4)
print("The number legs of dog: \(String(describing: dog?.numberOfLegs))")

let animal = Pet(numberOfLegs: -1)
print("The number legs of animal: \(String(describing: animal?.numberOfLegs))")


print("Practice with error protocol")
class Beverage{
    let flavor : String
    var amountOnHand : Int
    
    init(flavor : String, amountOnHand : Int) {
        self.flavor = flavor
        self.amountOnHand = amountOnHand
    }
}

enum BeverageError : Error{
    case tooFew(number : Int)
    case doNotSell
    case wrongFlavor
}

class Buy{
    var items = ["Coffee" : Beverage(flavor: "black", amountOnHand: 20),
                 "Water" : Beverage(flavor: "orange", amountOnHand: 10),
                 "Wine" : Beverage(flavor: "France", amountOnHand: 2)]
    
    func order(item : String,
               flavor : String,
               numberRequest : Int) throws -> Int{
        guard let beverage = items[item] else{
            throw BeverageError.doNotSell
        }
        
        guard flavor == beverage.flavor else {
            throw BeverageError.wrongFlavor
        }
        
        guard numberRequest < beverage.amountOnHand else {
            throw BeverageError.tooFew(number: beverage.amountOnHand)
        }
        
        beverage.amountOnHand -= numberRequest
        return beverage.amountOnHand
    }
}

let tom = Buy()
do{
    try tom.order(item: "Coffee", flavor: "Cappuccino", numberRequest: 10)
} catch BeverageError.tooFew{
    print("We don't have enough items to fulfill your order!")
} catch  BeverageError.doNotSell{
    print("We don't sell this item!")
} catch BeverageError.wrongFlavor{
    print("We don't sell this flavor, Please chose other flavor!")
}
