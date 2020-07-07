import UIKit

class Person{
    var firstName : String
    var lastName : String
    
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName : String{
        "\(firstName) \(lastName)"
    }
}

let TN = Person(firstName: "Thao", lastName: "Nguyen")
print("Fullname: \(TN.fullName)")
    

class Person {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
let john = Person(firstName: "Johnny", lastName: "Appleseed")
