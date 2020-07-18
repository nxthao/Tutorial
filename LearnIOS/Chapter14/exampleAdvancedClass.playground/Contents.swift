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


struct Grade{
    let letter : String
    let point : Int
}
class Student : Person{
    let grade : Grade
    
    init(firstName : String, lastName : String, grade : Grade) {
        self.grade = grade
        super.init(firstName: "Thao", lastName: lastName)
    }
    
//    convenience init(student : Student) {
//
//        (
//            firstName : student.firstName,
//            lastName : student.lastName,
//            grade : Grade(letter: "A", point: 10)
//        )
//    }
    
    func printInformation(){
        print("\(super.fullName()) are in grade \(self.grade)")
    }
    
    var grades : [Grade] = []
    func recordGrade(){
        grades.append(self.grade)
    }
}


let nn = Person(firstName: "Nguyen", lastName: "Nguyen")
print(nn.fullName())
let tn = Student(firstName: "Thao", lastName: "Nguyen", grade: Grade(letter: "A", point: 10))
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
var n = obeyMember(firstName: "Nguyen", lastName: "Nguyen", grade: Grade(letter: "A", point: 10))

// With a function but give many results.
phoneBookName(t)
phoneBookName(n)


print("Hierarchy check.")

var hierarchyCheck = Student(firstName: "hierarchy", lastName: "check", grade: Grade(letter: "C", point: 6))

hierarchyCheck as? BandMember
print((hierarchyCheck as? BandMember)?.minimumPracticeTime)

func afterClassActivity(person : Student){
    print("Go home.")
}

func afterClassActivity(person : BandMember){
    print("Go to practice.")
}

afterClassActivity(person: n as Student)
afterClassActivity(person: n as BandMember)


print("Overide")

class StudentAthelete : Student{
    var studenFailed : [Grade] = []
    
    
    convenience init(tn : Student) {
        self.init(firstName : tn.firstName, lastName : "Nguyen")
    }
    override func recordGrade() {
        super.recordGrade()
    }
    
}

var member = StudentAthelete(firstName: "Dao", lastName: "Nguyen", grade: Grade(letter: "A", point: 9))
print(member.fullName())
member.recordGrade()
print(member.grades)
