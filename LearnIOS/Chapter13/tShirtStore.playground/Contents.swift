import UIKit

typealias Size = String
let small : Size = "Small"
let medium : Size = "Medium"
let large : Size = "Large"
let xLarge : Size = "XLarge"

typealias Color = String
let blue : Color = "Blue"
let white : Color = "White"
let yellow : Color = "Yellow"
let red : Color = "Red"
let orange : Color = "Orange"


typealias Material = String
let coton : Material = "Coton"
let polyester : Material = "Polyester"
let wool : Material = "Wool"


struct Address{
    let street : String
    let city : String
    let zipCode : Int
    
    func printAddress() -> String{
        "City: \(self.city), street: \(self.street), Zip code: \(self.zipCode)"
    }
}


struct TShirt{
    let size : Size
    let color : Color
    let material : Material
    
    func price() -> Double{
        let originPrice : Double = 10.0
        var sizePrice : Double = 1.0
        var colorPrice : Double = 1.0
        var materialPrice : Double = 1.0
        
        switch self.size {
        case small, medium:
            sizePrice = 1.2
        case large, xLarge:
            sizePrice = 1.5
        default:
            print("\(self.size) is not supported")
        }
        
        switch self.color {
        case blue, white:
            colorPrice = 1.5
        case red, orange, yellow:
            colorPrice = 1.4
        default:
            colorPrice = 1.1
        }
        switch self.material {
        case coton:
            materialPrice = 1.1
        case polyester:
            materialPrice = 1.3
        case wool:
            materialPrice = 1.5
        default:
            print("\(self.material) is not supported")
        }
        
        return originPrice * sizePrice * colorPrice * materialPrice
    }
}


class ShoppingCart{
    var listTShirt : [TShirt] = []
    var address : Address
    
    init(address : Address) {
        self.address = address
    }
    
    func addTShirt(tShirt : TShirt) -> [TShirt]{
        listTShirt.append(tShirt)
        return listTShirt
    }
    
    func printTShirt() {
        listTShirt.map{
            print("Size: \($0.size)")
            print("Color: \($0.color)")
            print("Material: \($0.material)")
        }
    }
    
    // Sell with the same value for each TShirt.
    func totalCost() -> Double{
        var total : Double = 0.0
        for shirt in listTShirt{
            total = shirt.price()
        }
        return total
    }
}


class User{
    let name : String
    let email : String
    var shoppingCart : ShoppingCart
    
    init(name : String, email : String, shoppingCart : ShoppingCart) {
        self.name = name
        self.email = email
        self.shoppingCart = shoppingCart
    }
}

let selectTShirt1 = TShirt(size: "Medium", color: "Blue", material: "Coton")
let selectTShirt2 = TShirt(size: "Large", color: "white", material: "polyester")
let myAddress = Address(street: "120", city: "Ho Chi Minh", zipCode: 71218)
let shopping = ShoppingCart(address: myAddress)
shopping.addTShirt(tShirt: selectTShirt1)
let tn = User(name: "Thao Nguyen", email: "nxthao0701@gmail.com", shoppingCart: shopping)
print("Customer: \(tn.name)")
print("List T-Shirt:")
tn.shoppingCart.printTShirt()

// Add more T-Shirt
tn.shoppingCart.addTShirt(tShirt: selectTShirt2)
tn.shoppingCart.printTShirt()

print("Address of customer: \(tn.shoppingCart.address.printAddress())")

