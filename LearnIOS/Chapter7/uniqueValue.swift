let dic = ["Thao" : 8, "Nguyen" : 9, "Hieu" : 7, "Dao" : 8]

func uniqueValue(_ dic : [String : Int]) -> Bool{
	var result : Set<Int> = []
	for value in dic.values{
		if result.contains(value){
			return false
		}
		result.insert(value)
	}
	return true
}

let checkUniqueDic = uniqueValue(dic)
print(checkUniqueDic)