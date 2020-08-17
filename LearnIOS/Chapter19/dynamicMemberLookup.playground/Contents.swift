import UIKit

@dynamicMemberLookup
struct Person{
    subscript(dynamicMember member : String) -> String{
        let properties = ["firstName" : "Thao", "lastName" : "Nguyen"]
        return properties[member , default : ""]
    }
    
    subscript(dynamicMember member : String) -> Int{
        let properties = ["Age" : 25, "height" : 165]
        return properties[member, default: 0]
    }
}

let people = Person()
let name : String = people.firstName + " " + people.lastName
print("Fullname: \(name)")

let age : Int = people.Age
print(age)
let height : Int = people.height
print(height)
