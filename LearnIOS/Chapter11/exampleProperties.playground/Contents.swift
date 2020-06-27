import UIKit

print("TV properties")

struct TV{
    var height : Double
    var width : Double
    
    var diagonal : Int{
        let result = (height * height + width * width).squareRoot().rounded()
        return Int(result)
    }
}
let diagonalTV = TV(height: 22, width: 30).diagonal
print("Diagonal of TV: \(diagonalTV) cm")
