import UIKit

protocol Container{
    associatedtype Item
    mutating func append(item : Item)
    var count : Int { get }
    subscript(i : Int) -> Item{ get }
}

struct Stack<Element> : Container{
    var items : [Element]
    
    mutating func push(item : Element){
        items.append(item)
    }
    
    mutating func pop() -> Element{
        return items.removeLast()
    }
    
    // Conformance to the Container protocol
    mutating func append(item: Element) {
        self.push(item: item)
    }
    
    var count: Int{
        return items.count
    }
    
    subscript(i : Int) -> Element{
        return items[i]
    }
}

func allItemsMatch<C1 : Container, C2 : Container>(container1 : C1, container2 : C2) -> Bool
    where C1.Item == C2.Item, C1.Item : Equatable{
        if container1.count != container2.count{
            return false
        }
        
        for i in 0..<(container1.count){
            if container1[i] != container2[i]{
                return false
            }
        }
        return true
}

var empty : [Int] = []
var con1 = Stack<Int>(items: empty)
con1.append(item: 2)
con1.push(item: 7)
con1.push(item: 5)
con1.push(item: 6)
con1.append(item: 8)

var con2 = Stack<Int>(items: empty)
con2.append(item: 2)
con2.push(item: 7)
con2.push(item: 5)
con2.push(item: 6)
con2.append(item: 9)

if allItemsMatch(container1: con1, container2: con2) {
    print("container1 and container2 is the same.")
}
else{
    print("container1 and container2 is not the same.")
}
