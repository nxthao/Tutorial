import UIKit

var str = "Hello Thao  Nguyen from the world"

func splitFunction(for str : String, separatedBy : Character) -> [String]?{
    guard str.count > 0 else {
        return nil
    }
    var result : [String] = []
    var lastWorldIndex = str.startIndex
    for i in str.indices{
        if str[i] == separatedBy{
            // if next element is differrence with current element we will do
            if str[str.index(after: i)] != separatedBy{
                let elementStr = str[lastWorldIndex..<i]
                result.append(String(elementStr))
                lastWorldIndex = str.index(after: i)
            }
        }
    }
    //    Add last String in result
    let element = str[lastWorldIndex..<str.endIndex]
    result.append(String(element))
    return result
}
if let result = splitFunction(for: str, separatedBy: " "){
    print(result)
}
