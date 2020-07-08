import UIKit

print("Working with reference.")

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
print("Full name: \(TN.fullName)")
TN.firstName = "T"
var origin = TN
print("First name: \(TN.firstName)")
print("First name of origin: \(origin.firstName)")
print("Come back default.")
TN.firstName = "Thao"


print("Object identity.")
if TN === origin{
    print("OK")
}

var multiplePeople = Person(firstName: "Thao", lastName: "Nguyen")
if TN === multiplePeople{
    print("TN is same multiplePeople.")
}
else{
    print("TN is not same multiplePeople.")
}

var imposters = (0...100).map{_ in
    Person(firstName: "Thao", lastName: "Nguyen")
}

print(imposters.contains{$0.firstName == TN.firstName && $0.lastName == TN.lastName})

print(imposters.contains(where: {$0 === TN})) // false

// Insert TN to imposter
imposters.insert(TN, at: Int.random(in: 0...100))

print(imposters.contains(where: {$0 === TN})) // true

if let indexTN = imposters.firstIndex(where: {$0 === TN}){
    imposters[indexTN].firstName = "T"
    imposters[indexTN].lastName = "N"
}
print(TN.fullName)
