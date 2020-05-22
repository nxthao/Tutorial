func removing(_ number: Int,_ array: [Int]) -> [Int]{
	var result = array
	//for element in array{
	// if element = number
	while let index = result.firstIndex(of: number){
		result.remove(at: index)
	}
    return result
}

var array = [2, 4, 6, 2, 8, 9, 0, 4]
var result = removing(2, array)
print(result)