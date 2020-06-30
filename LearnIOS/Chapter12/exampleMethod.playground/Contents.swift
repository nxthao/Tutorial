import UIKit

print("How many months until the winter break: ")

struct SimpleDay{
    let currentMonth : String
    func monthsUntilWinterBreak() -> Int?{
        months.firstIndex(of: "December")! - months.firstIndex(of: self.currentMonth)!
    }
}

let months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
]

let monthsFromJuly = SimpleDay(currentMonth: "July")
print("\(monthsFromJuly.monthsUntilWinterBreak()!) months")
