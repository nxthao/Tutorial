import UIKit

print("Hello Spring!")

let months = ["January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"]

struct Date{
    var month = "January"
    var monthsUntilWinterBreak : Int{
        months.firstIndex(of: "December")! - months.firstIndex(of: month)!
    }
}

let fromAugust = Date(month: "August")
print("How many months: \(fromAugust.monthsUntilWinterBreak)")
