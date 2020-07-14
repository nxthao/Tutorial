import UIKit

class Person{
    var firstName : String
    var lastName : String
    
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String{
        "\(self.firstName) \(self.lastName)"
    }
}


class Student : Person{
    let grade : Int
    
    init(firstName : String, lastName : String, grade : Int) {
        self.grade = grade
        super.init(firstName: firstName, lastName: lastName)
    }
    
    
    func printInformation(){
        print("\(super.fullName()) are in grade \(self.grade)")
    }
}


let nn = Person(firstName: "Nguyen", lastName: "Nguyen")
print(nn.fullName())
let tn = Student(firstName: "Thao", lastName: "Nguyen", grade: 20)
tn.printInformation()


print("Polymorphism")
class BandMember : Student{
    var minimumPracticeTime = 2
}

class obeyMember : BandMember{
    override var minimumPracticeTime: Int{
        get{
            super.minimumPracticeTime * 2
        }
        set{
            super.minimumPracticeTime = newValue / 2
        }
    }
}

func phoneBookName(_ person : Person){
    print("\(person.fullName())")
}
var t = Person(firstName: "Thao", lastName: "Nguyen")
var n = obeyMember(firstName: "Nguyen", lastName: "Nguyen", grade: 20)

// With a function but give many results.
phoneBookName(t)
phoneBookName(n)


