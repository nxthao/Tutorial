import UIKit

enum Month : Int{
    case january = 1, february, march, april, may, june, july, august, september, october, november, december
    
    var monthsUntilSummer : Int{
        var numberOfMonths = Month.june.rawValue - self.rawValue
        if (numberOfMonths < 0)
        {
            numberOfMonths += 12
        }
        return numberOfMonths
    }
}

let month = Month.february
print("At the moment, It is \(month). Therefore, Wait to summer: \(month.monthsUntilSummer) months\n")
