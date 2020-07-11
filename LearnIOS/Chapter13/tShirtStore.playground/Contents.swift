import UIKit

struct Address{
    let street : String
    let city : String
    let zipCode : Int
}

struct TShirt{
    let size : Int
    let color : String
    let image : String
}

class ShopingCart{
    var listTShirt : [TShirt] = []
    var address : Address
    
    init(address : Address) {
        self.address = address
    }
    
    func addTShirt(tShirt : TShirt) -> [TShirt]{
        listTShirt.append(tShirt)
        return listTShirt
    }
    
    // Sell with the same value for each TShirt.
    func totalCost() -> Int{
        listTShirt.count * 10
    }
}

class User{
    let name : String
    let email : String
    var shopingCart : ShopingCart
    
    init(name : String, email : String, shopingCart : ShopingCart) {
        self.name = name
        self.email = email
        self.shopingCart = shopingCart
    }
}
