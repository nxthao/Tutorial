import UIKit

func countWord(sentence : String) -> Int{
    var count = 0
    var spaceFlag = false
    for index in sentence.indices{
        if sentence[index] == " "{
            if spaceFlag == false{
                count += 1
                spaceFlag = true
            }
        }
        else{
            spaceFlag = false
        }
    }
    count += 1
    return count
}
var str = "Hello Thao Nguyen from the      world."

let numberOfWords = countWord(sentence: str)
print("The number of words: \(numberOfWords)")


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

let separatedString = split(sentence: str, seperatedby: " ")
print(separatedString)

func reverseSentence(sentence : String) -> String{
    var newSentence : String = ""
    var newWord : String = ""
    var flagIndex = false
    var startInd = sentence.startIndex
    let lastIndex = sentence.endIndex
    
    for ind in sentence.indices{
        if sentence[ind] == " "{
            if flagIndex == false{
                newWord = String(sentence[startInd..<ind])
                newSentence.insert(contentsOf: newWord, at: sentence.startIndex)
                newSentence.insert(" ", at: sentence.startIndex)
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
    newWord = String(sentence[startInd..<lastIndex])
    newSentence.insert(contentsOf: newWord, at: sentence.startIndex)
    return newSentence
}

let reverse = reverseSentence(sentence: str)
print(reverse)
