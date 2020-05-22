
func isNumberDivisible(_ number: Int, _ divisor: Int) -> Bool{
    if number % divisor == 0 {
        return true
    }
    else {
        return false
    }
}

func isPrime(_ number: Int) -> (value: Bool, number: Int) {
    for i in stride(from: 2, to: number, by: 1){
        if isNumberDivisible(number, i) {
            return (false, number)
        }
    }
    if number <= 0 {
        return (false, number)
    }
    return (true, number)
}

for i in stride(from: 0, through: 20, by: 1) {
    let result = isPrime(i)
    if result.value {
        print("\(result.number) is a prime.")
    }
    else {
        print("\(result.number) is not a prime.")
}
}

