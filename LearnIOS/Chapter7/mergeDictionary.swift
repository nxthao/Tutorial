
var dic1 = ["Thao" : 7, "Nguyen" : 9]
var dic2 = ["Thao" : 8, "Dao" : 9, "Hieu" : 10]

func mergeDictionary(_ dic1 : [String : Int], _ dic2 : [String: Int]) -> [String : Int]{
    var dic = dic1
    for (key, value) in dic2 {
        dic[key] = value
    }
    return dic
}

let result = mergeDictionary(dic1, dic2)
print("Dictionary after merging: \(result)")