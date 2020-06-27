import UIKit

var str = "Hello, playground"

typealias Size = String
let small : Size = "Small"
let medium : Size = "Medium"
let large : Size = "Large"
let xLarge : Size = "Extra Large"

typealias Color = String

typealias Material = String
let coton : Material = "Coton"
let polyester : Material = "Posyester"
let wool : Material = "Wool"

struct TShirt{
    var size : Size
    var color : Color
    var material : Material
}
func price(tShirt : TShirt) -> Double{
    let originPrice = 10.0
    var sizePrice = 0.0
    var materialPrice = 0.0
    switch tShirt.size {
    case small, medium:
        sizePrice = 1
    case large:
        sizePrice = 1.2
    case xLarge:
        sizePrice = 1.4
    default:
        print("This size is not supported")
    }
    
    switch tShirt.material {
    case coton:
        materialPrice = 1.0
    case polyester:
        materialPrice = 1.2
    case wool:
        materialPrice = 1.4
    default:
        print("This material is not supported")
    }
    return originPrice * sizePrice * materialPrice
}
let buyTshirt = price(tShirt: TShirt(size: small, color: "green", material: wool))
print("price:\t\(buyTshirt)$")
