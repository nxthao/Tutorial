import UIKit

extension Int{
    var isEven : Bool{
        self % 2 == 0
    }
    
    var isOdd : Bool{
        self % 2 != 0
    }
}

print("Is 5 even? \(5.isEven).")
print("Is 8 even? \(8.isEven).")
print("Is 3 odd? \(3.isOdd).")

