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
tn.printList()

class User{
    var list : [String : [String]] = [:]
    func addList(user: List){
        list[user.name] = user.movieTitle
    }
    
    func listName(forName : String) -> List?{
//        guard list.isEmpty else {
//            return nil
//        }
//        if list.contains(where: $0.keys == forName){
//            return
//        }
        List[forName]
    }
}
