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

// To use raw value, need to clare it in decalare of enum.( If declare Int: raw will be Int, if String, raw will be String)
func monthsUntilNewYear(month : Month) -> Int{
    Month.december.rawValue - month.rawValue
}

let jan = Month.january
print(jan)
print("Which season is january? \(season(month: jan))")
print(monthsUntilNewYear(month: jan))
