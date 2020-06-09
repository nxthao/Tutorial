// first way
func mathSum(length : Int, series : (Int) -> Int) -> Int {
	var total = 0
	for i in 0...length {
		total += series(i)
	}
	return total
}

let result = mathSum(length : 10) {
	$0 * $0
}
print(result)

// second way
func mathSum(length : Int, series : (Int) -> Int) -> Int {
	return (0...length).map{series($0)}.reduce(0, +)
}
let result = mathSum(length : 10) {
	$0 * $0
}
print(result)

// Fibonacii
func fibonacii(_ number : Int) -> Int
{
	
	if number <= 0{
		return 0
	}
	else if number == 1{
		return 1
	}
	else {
		return fibonacii(number - 1) + fibonacii(number - 2)
	}
}

let result = mathSum(length : 10, series : fibonacii)
print(result)