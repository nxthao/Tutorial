import UIKit

print("How many months until the winter break: ")

struct SimpleDay{
    var currentMonth = "January"
    func monthsUntilWinterBreak() -> Int?{
        months.firstIndex(of: "December")! - months.firstIndex(of: self.currentMonth)!
    }
}

let months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
]

let monthsDefault = SimpleDay()
print("\(monthsDefault.monthsUntilWinterBreak()!) months.")
let monthsFromJuly = SimpleDay(currentMonth: "July")
print("\(monthsFromJuly.monthsUntilWinterBreak()!) months.")


print("Type method.")
// Unable to access to property when using Static in method
print("Factorial does n't use type method.")
struct Math{
    var number : Int

    func factorial() -> Int{
        (1...self.number).reduce(1, *)
    }
}
let result = Math(number: 6)
print(result.factorial())

print("Factorial uses type method (Static).")
struct MathTypeMethod{
    static func factorial(number : Int) -> Int{
        (1...number).reduce(1, *)
    }
}
print(MathTypeMethod.factorial(number: 6))


