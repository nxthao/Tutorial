import UIKit

struct Toy : Codable{
    var name : String
}

struct Employee : Codable{
    var name : String
    var id : Int
    var favariteToy : Toy?
}

let toy1 = Toy(name: "Car")
let employee1 = Employee(name: "Tom", id: 20, favariteToy: toy1)

let encoder = JSONEncoder()
let dataJson = try encoder.encode(employee1)

print(dataJson)

let dataJsonString = String(data: dataJson, encoding: .utf8)!
print(dataJsonString)

print("Decoder")
let jsonDecoder = JSONDecoder()
let employee2 = try jsonDecoder.decode(Employee.self, from: dataJson)
print(employee2)
