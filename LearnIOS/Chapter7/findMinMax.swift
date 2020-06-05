func findMinMax(_ array: [Int]) -> (Int, Int){
    guard !array.isEmpty else {
        return nil
    }
    var min = array[0]
    var max = array[0]
    for element in array {
        if element < min{
            min = element
        }
        else if element > max{
            max = element
        }
    }
    return (min, max)
}

let array = [2, 4, 5, 6, 2, 4, 8]
var result = findMinMax(array)
print(result.min)
print(result.max)