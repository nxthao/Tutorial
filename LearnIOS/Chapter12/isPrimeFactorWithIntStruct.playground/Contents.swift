import UIKit

extension Int{
    var isPrimeFactor : [Int]{
        var number = self
        var prime : [Int] = []
        var factor : Int = 2
        while number >= factor{
            if number % factor == 0{
                prime.append(factor)
                number /= factor
            }
            else{
                factor += 1
            }
        }
        if number > 1{
            prime.append(number)
        }
    return prime
    }
}

print("\(10.isPrimeFactor)")
print("\(2.isPrimeFactor)")
