import Foundation

let size = Int(readLine()!)!
let dataInput = readLine()!

func split(_ text: String, _ separatedBy : Character) -> [Int]{
    var startInd = text.startIndex
    let lastInd = text.endIndex
    var newText : [Int] = []
    var flagIndex = false
    for ind in text.indices{
        if text[ind] == separatedBy{
            if flagIndex == false{
                let newWord = Int(text[startInd ..< ind]) ?? 0
                newText.append(newWord)
                flagIndex = true
            }
        }
        else{
            if flagIndex == true{
                startInd = ind
            }
            flagIndex = false
        }
    }
    let newWord = Int(text[startInd ..< lastInd]) ?? 0
    newText.append(newWord)
    return newText
}

func sum(_ data : [Int]) -> Int{
    var s = 0
    for ind in data.indices{
       s += data[ind] 
    }
    return s
}

// Take data from second line
let data = split(dataInput, " ")
// calculate sum
print("\(sum(data))")




