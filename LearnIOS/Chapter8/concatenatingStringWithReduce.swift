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