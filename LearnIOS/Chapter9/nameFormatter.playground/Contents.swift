import UIKit

var str = "Nguyen, Thao"

func formatter(name str : String) -> String{
    guard str.count > 0 else {
        return " "
    }
    let commaIndex = str.firstIndex(of: ",")!
    let lastName = str[..<commaIndex]
    let firstName = str[commaIndex...].dropFirst(2)
    return firstName + " " + lastName
}
print(formatter(name: str))
