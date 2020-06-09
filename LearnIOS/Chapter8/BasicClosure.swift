let namesAndAges = ["Truc" : 16,"Thao" : 25, "Nguyen" : 25, "Dao" : 28, "Hieu" : 27]

let children = namesAndAges.filter{
	$0.value < 18
}

print(children)

let adultName = namesAndAges.filter{
	$0.value >= 18
}.map{
	$0.key
}
print(adultName)


let names = ["Thao", "Nguyen", "Dao", "Hieu"]

var concatenatingName = names.reduce(""){
	$0 + $1
}

print(concatenatingName)

var longName = names.filter {
	$0.count >= 3
}.reduce(""){
	$0 + $1
}
print(longName)


func repeatTask(times : Int, task : () -> void){
 for _ in 0..<times {
task()
 }
 }
 let result = repeatTask(10){
  print("Swift Apprentice is a great book!" )
}
 