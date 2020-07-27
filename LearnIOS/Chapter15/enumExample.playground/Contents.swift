import UIKit

enum Month{
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
print("Which season is january? \(season(month: jan))")
