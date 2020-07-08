import UIKit

class Person{
    var firstName : String
    var lastName : String
    
    init(firstName : String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    var fullName : String{
        "\(firstName) \(lastName)"
    }
}

func numberOf(person : Person, group : [Person]) -> Bool{
    group.contains(where: {$0 === person})
}

var group1 = (0...4).map{_ in Person(firstName: "Dao", lastName: "Nguyen")}
var group2 = (0...4).map{_ in Person(firstName: "Dao", lastName: "Nguyen")}
var TN = Person(firstName: "Thao", lastName: "Nguyen")
group1.insert(TN, at: Int.random(in: 0...5))
print("\(numberOf(person: TN, group: group1))")
print("\(numberOf(person: TN, group: group2))")
