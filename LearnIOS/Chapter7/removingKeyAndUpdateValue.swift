var nameTitleLookup: [String: String?] = ["Mary": "Engineer","Patrick": "Intern", "Ray": "Hacker"]

func removingKeyAndUpdateValue(_ name : [String : String?]) -> [String : String?]{
	var dic = name
    dic.updateValue(nil, forKey: "Ray") // remove value
	dic["Patrick"] = nil // remove key and value
	return dic
}

var result = removingKeyAndUpdateValue(nameTitleLookup)
print(result)