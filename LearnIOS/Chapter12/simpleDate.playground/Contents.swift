import UIKit

var months = ["January", "February", "March", "April", "May", "June",
"July", "August", "September", "October", "November", "December"]

struct SimpleDate{
    var month : String = "January"
    var day : Int = 1
    
    func totalDayInMonth() -> Int {
        switch self.month {
        case "January", "March", "May", "July", "August", "OCtober", "December":
            return 31
        case "February":
            return 28
        default:
            return 30
        }
    }
    
    mutating func advance(){
        if (totalDayInMonth() == self.day){
            if self.month == "December"{
                self.month = "January"
            }
            else{
                self.month = months[months.firstIndex(of: self.month)!.advanced(by: 1)]
            }
            self.day = 1
        }
        else{
            self.day += 1
        }
    }
}

var date = SimpleDate(month: "December", day: 31)
date.advance()
print(date.month)
print(date.day)
