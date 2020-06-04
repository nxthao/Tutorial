
let nameState = ["NY": "New York", "CA":"California"]

func takeLongName(_ dic: [String: String]) -> [String]{
	var longName : [String] = []
	for (key, value) in dic{
		if value.count > 0
		{
			longName.append(value)
		}
	}
	return longName
}

var result = takeLongName(nameState)
print(result)