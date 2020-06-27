import UIKit

typealias Size = String
let small : Size = "Small"
let medium : Size = "Medium"
let large : Size = "Large"
let xLarge : Size = "Extra Large"

typealias Color = String

typealias Material = String
let coton : Material = "Coton"
let polyester : Material = "Polyester"
let wood : Material = "Wood"

struct TShirt {
    let size : Size
    let color : Color
    let material : Material
    
    func price() -> Double{
        let originPrice = 10.0
        var colorPrice = 0.0
        var materialPrice = 0.0
        
        switch size {
        case small, medium:
            colorPrice = 1.1
        case large:
            colorPrice = 1.3
        case xLarge:
            colorPrice = 1.5
        default:
            print("This color is not supported")
        }
        
        switch material {
        case coton:
            materialPrice = 1.1
        case polyester:
            materialPrice = 1.3
        case wood:
            materialPrice = 1.5
        default:
            print("This material is not supported")
        }
        
        return Double(originPrice * colorPrice * materialPrice)
    }
}

let totalPrice = TShirt(size: small, color: "white blue", material: polyester).price()
print("Total price: \t \(totalPrice) $")



