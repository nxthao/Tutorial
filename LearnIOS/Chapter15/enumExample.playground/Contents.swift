import UIKit
import Foundation

enum Month : Int{
    case january
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
}

func season(month : Month) -> String{
    switch month {
    case Month.march, Month.april, Month.may:
        return "Spring"
    case Month.june, Month.july, Month.august:
        return "Summer"
    case Month.september, Month.october, Month.november:
        return "Autumn"
    default:
        return "Winter"
    }
}

let jan = Month.january
print(jan)
print("Which season is january? \(season(month: jan))")

print("Raw value")
// To use raw value, need to clare it in decalare of enum.( If declare Int: raw will be Int, if String, raw will be String)
func monthsUntilNewYear(month : Month) -> Int{
    Month.december.rawValue - month.rawValue
}
print(monthsUntilNewYear(month: jan))


print("Unorder raw value")
enum Coin : Int{
    case penny = 1
    case nickel = 5
    case quarter = 25
}

let coin = Coin.quarter.rawValue
print("Coin: \(coin)")

// Associate a custom value (or values) with each enumeration case
print("Associated values")

var balance = 50
enum WithDrawResult{
    case success(newBalance : Int)
    case error(message: String)
}

func withDraw(amount : Int) -> WithDrawResult{
    if balance >= amount{
        balance -= amount
        return .success(newBalance: balance)
    }
    else{
        return . error(message: "The money is not enough in ATM card")
    }
}

let money = withDraw(amount: 70)
switch money{
case .success(newBalance: let newBalance):
    print("The money remain: \(newBalance)")
case .error(message: let message):
    print(message)
}
