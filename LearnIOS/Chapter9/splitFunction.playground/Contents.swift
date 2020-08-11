import UIKit

var str = "Hello Thao Nguyen from the   world"

func split(sentence : String, seperatedby : Character) -> [String]{
    var startInd = sentence.startIndex
    let lastIndex = sentence.endIndex
    var flagIndex = false
    var newSentence : [String] = []
    for ind in sentence.indices{
        if sentence[ind] == seperatedby{
            if flagIndex == false{
                let elementSentence = String(sentence[startInd..<ind])
                newSentence.append(elementSentence)
            }
            flagIndex = true
        }
        else{
            if flagIndex == true{
                startInd = ind
            }
            flagIndex = false
        }
    }
    let lastSentence = String(sentence[startInd..<lastIndex])
    newSentence.append(lastSentence)
    return newSentence
}

let result = split(sentence: str, separatedBy: " ")
print(result)

