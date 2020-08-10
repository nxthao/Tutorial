import UIKit

var list = ["Thao" : 25, "Nguyen" : 25, "Dao" : 28, "Hieu" : 27]

let lessThan27 = list.filter{
    $0.value < 27
}.map{
    $0.key
}.reduce(""){
    $0 + $1
}
print(lessThan27)
