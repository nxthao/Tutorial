import UIKit

// Review 1
func countCharacter(msg : String) -> [Character : Int]{
    var list : [Character : Int] = [:]
    for char in msg{
        list[char, default : 0] += 1
    }
    return list
}

var message = "Hello Thao Nguyen"
var charListMsg = countCharacter(msg: message)
print(charListMsg)


// Review 2
func minMax(list : [Int]) -> (min : Int, max : Int){
    var min : Int = list[0]
    var max : Int = list[0]
    for i in list{
        if min > i{
            min = i
        }
        else if max < i {
            max = i
        }
    }
    return (min, max)
}

var numberList = [2, 4, 6, 10, 30, 78, 20, 10, 80, 70, 50, 25]
let result = minMax(list: numberList)
print("Min: \(result.min)")
print("Max: \(result.max)")


// Review 3
func mergeDict(dic1 : [Character : Int], dic2 : [Character : Int]) -> [Character : Int]{
    var merge : [Character : Int] = dic1
    for (key, value) in dic2{
        merge[key] = value
    }
    return merge
}

var dicA : [Character : Int] = ["A" : 3, "B" : 7]
var dicB : [Character : Int] = ["C" : 10, "D" : 5]
var mergeResult = mergeDict(dic1: dicA, dic2: dicB)
print(mergeResult)


// Review 4
func middle(list : [Int]) -> Int{
    list[list.count / 2]
}
let middleNumber = middle(list: numberList)
print(numberList)
print("Middle number: \(middleNumber)")


// Review 5
func removeProvince(remove : String, provices : [String : String]) -> [String : String]{
    var newList = provices
    newList[remove] = nil
    return newList
}

var province = ["HN" : "Ha Noi", "DK" : "Dak Lak", "HCM" : "Ho chi Minh"]
var newProvinces = removeProvince(remove: "HN", provices: province)
print(newProvinces)
