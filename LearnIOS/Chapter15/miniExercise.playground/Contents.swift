import UIKit

print("Season")
enum Month : Int{
    case january = 1, february, march, april, may, june, july, august, september, october, november, december
    
    var season : String{
        switch self {
        case .march, .april, .may:
            return "Spring"
        case .june, .july, .august:
            return "Summer"
        case .september, .october, .november:
            return "Fall or autumn"
        case .december, .january, .february:
            return "Winter"
        }
    }
    
    // Imagine, Lunar New Year is in february
    var monthsUntilLunarNewYear : Int{
        var numbersOfMonth = Month.january.rawValue - self.rawValue
        if numbersOfMonth < 0 {
            numbersOfMonth += 12
        }
        return numbersOfMonth
    }
}

let month = Month.april
print("The season: \(month.season)\n")


print("Wait to come Lunar New Year")
let newYear = Month.july
print("At the moment, it is \(newYear). So wait: \(newYear.monthsUntilLunarNewYear) months\n")


print("Array of enum")
enum Coin : Int{
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 15
}

let coinPurse : [Coin] = [.penny, .nickel, .dime, .quarter, .dime, .quarter, .dime, .nickel, .dime]

func value(money : [Coin]) -> Int
{
    var balance = 0
    for coin in money{
        balance += coin.rawValue
    }
    return balance
}
print("Balance: \(value(money: coinPurse))\n")


print("Status of light")
enum Light{
    case off, on
}

let lightStatus = Light.on
print("Status of light: \(lightStatus)\n")

