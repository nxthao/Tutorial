import UIKit

var provinceList = ["DL" : "Dak Lak", "HCM" : "Ho Chi Minh", "HN" : "Ha Noi"]

func takeLongName(provinceList : [String : String]) -> [String]{
    var fullName : [String] = []
    for (_, value) in provinceList{
        if value.count > 0{
            fullName.append(value)
        }
    }
    return fullName
}

print(takeLongName(provinceList: provinceList))

func removingNumber(of number : Int, numberList : [Int]) -> [Int]{
    var newList : [Int] = numberList
    if let indexOfNumber = newList.firstIndex(of: number){
        newList.remove(at: indexOfNumber)
    }
    return newList
}

var numberList = [2, 4, 6, 7, 3, 5, 8, 9, 10]
print(removingNumber(of: 7, numberList: numberList))


func devide(devider : Int, devided : Int) -> Int{
    return devider % devided
}

func isPrime(number : Int) -> Bool{
    if number == 1{
        return true
    }
    for i in 2..<number{
        if devide(devider: number, devided: i) == 0{
            return false
        }
    }
    return true
}

for number in 1...20{
    if isPrime(number: number){
        print("\(number) is a prime")
    }
    else{
        print("\(number) is not prime")
    }
}


var restaurentLocation = (5, 7)
var restaurentRange = 5.0
var customerLocation = (20, 9)

func distance(locationA : (x : Int, y : Int), locationB : (x : Int,y : Int)) -> Double{
    let distanceX = locationA.x - locationB.x
    let distanceY = locationA.y - locationB.y
    
    return sqrt(Double(distanceX * distanceX + distanceY * distanceY))
}

func isDelivery(customerLocation : (Int, Int)) -> (distanceCusToRes : Double, isFree : Bool){
    let dis = distance(locationA: customerLocation, locationB: restaurentLocation)
    if dis < restaurentRange{
        return (dis, true)
    }
    else{
        return (dis, false)
    }
}

var result = isDelivery(customerLocation: customerLocation)
if result.isFree{
    print("Distance: \(result.distanceCusToRes) Km. So, delivery is free.")
}
else{
    print("Distance: \(result.distanceCusToRes) Km. So, delivery is not free.")
}
