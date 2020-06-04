func reversed(_ array: [Int]) -> [Int]{
	var result: [Int] = []
	for element in array {
		result.insert(element, at: 0)
	}
    return result
}
var a = [1, 2, 3, 5, 7, 2, 8]
var result = reversed(a)
print(result)