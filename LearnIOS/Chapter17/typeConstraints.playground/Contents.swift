import UIKit

func findIndex<T : Equatable>(findThing : T, inList : [T]) -> Int?{
    for (index, value) in inList.enumerated(){
        if findThing == value{
            return index
        }
    }
    return nil
}

let names = ["Thao", "Nguyen", "Dao", "Hieu"]
if let foundString = findIndex(findThing : "Nguyen", inList : names){
    print("Index: \(foundString)")
}

let numbers = [2, 5, 6, 7, 3, 4, 8, 10]
if let foundIndexInt = findIndex(findThing: 3, inList: numbers){
    print("Index: \(foundIndexInt)")
}
