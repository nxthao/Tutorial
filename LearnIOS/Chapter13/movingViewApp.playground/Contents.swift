import UIKit

class List{
    var name : String
    var movieTitle : [String]
    
    init(name : String, movieTitle : [String]) {
        self.name = name
        self.movieTitle = movieTitle
    }
    
    func printList(){
        movieTitle.map{
            print($0)
        }
    }
}

let tn = List(name: "Thao Nguyen", movieTitle: ["Descendants of the sun", "Iris"])
//tn.printList()

class User{
    var list : [String : List] = [:]
    func addList(user: List){
        list[user.name] = user
    }
    
    func listName(forName : String) -> List?{
        if list.contains(where: {$0.key == forName}){
            return list[forName]
        }
        else{
            return nil
        }
    }
}

let jane = User()
let john = jane
jane.addList(user: tn)
john.addList(user: tn)

jane.addList(user: List(name: "Dao Hieu", movieTitle: ["Rambo"]))

john.listName(forName: "Thao Nguyen")?.movieTitle.append("Terminator")

print("With name \"Thao Nguyen\", John should have: Descendants of the sun, Iris, Terminator")
john.listName(forName: "Thao Nguyen")?.printList()

print("With name \"Thao Nguyen\", Jane should have: Descendants of the sun, Iris, Terminator")
jane.listName(forName: "Thao Nguyen")?.printList()

print("With name \"Dao Hieu\", Jane should have: Rambo")
jane.listName(forName: "Dao Hieu")?.printList()
