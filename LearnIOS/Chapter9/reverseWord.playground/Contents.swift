import UIKit

var str = "I am come from Dak Lak province"

func reverseWord(for str : String, seperatedBy : Character) -> [String]?{
    guard str.count > 0 else {
        return nil
    }
    var result : [String] = []
    var lastIndex = str.startIndex
    var elementWord : String = ""
    for i in str.indices{
        if str[i] == seperatedBy{
            if str[str.index(after: i)] != seperatedBy{
                elementWord = String(str[lastIndex..<i])
                var reversedElement : String = ""
                for j in elementWord{
                    reversedElement.insert(j, at: elementWord.startIndex)
                }
                lastIndex = str.index(after: i)
                result.append(reversedElement)
            }
        }
    }
    elementWord = String(str[lastIndex...str.index(before: str.endIndex)])
    var reversedElement : String = ""
    for j in elementWord{
        reversedElement.insert(j, at: elementWord.startIndex)
    }
    result.append(reversedElement)
    return result
}
if let reversedString = reverseWord(for: str, seperatedBy: " "){
    print(reversedString)
}

