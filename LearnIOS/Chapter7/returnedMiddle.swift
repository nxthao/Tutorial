func returnedMiddle(_ array: [Int]) -> Int{
    guard !array.isEmpty else {
        return nil
    } 
    return array[array.count/2]
}

let array = [2, 4, 5, 6, 2, 4, 8]
var result = returnedMiddle(array)
print(result)
