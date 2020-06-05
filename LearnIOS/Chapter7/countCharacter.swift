let a = "Thao Nguyen Dak Lak"

func countCharacter(_ a : String) -> [Character : Int]{
	var character : [Character : Int] = [:]
	for element in a{
		if let count = character[element]{
			character[element] = count + 1
		}
		else{
			character[element] = 1
		}
	}
	return character
}

let result = countCharacter(a)
print(result)