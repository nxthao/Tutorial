import UIKit

class Person{
    var firstName : String
    var lastName : String
    
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

struct Grade{
    var letter : String
    var point : Int
}

class Student : Person{
    var grades : [Grade] = []
}

class Atheletes : Student{
    var sport : String
    
    init(firstName: String, lastName: String, sport : String) {
        self.sport = sport
        super.init(firstName: firstName, lastName: lastName)
    }
}

class FootballPlayer : Atheletes{
    var goals : Int
    var number : Int
    var position : String
    
    init(firstName : String, lastName : String, sport : String, goals : Int, number : Int, position : String) {
        self.goals = goals
        self.number = number
        self.position = position
        super.init(firstName: firstName, lastName: lastName, sport: sport)
    }
    
    func information()
    {
        print("Fullname : \(firstName) \(lastName)")
        print("Sport: \(sport)")
        print("Goals: \(goals)")
        print("number: \(number)")
        print("position: \(position)")
    }
}

let tn = FootballPlayer(firstName: "Thao", lastName: "Nguyen", sport: "Football", goals: 20, number: 8, position: "Midfielder")

tn.information()
