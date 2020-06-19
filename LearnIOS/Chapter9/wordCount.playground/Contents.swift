import UIKit

var str = "Hello Thao Nguyen from the world."

func wordCount(for str : String) -> Int {
    var count = 0
    var lastSpace = false
    guard str.count > 0 else {
        return 0
    }
    for element in str {
        if element == " " && lastSpace == false{
            count += 1
            lastSpace = true
        }
        lastSpace = false
    }
    // count 1 for last word
    count += 1
    return count
}

let result = wordCount(for : str)
print(result)
