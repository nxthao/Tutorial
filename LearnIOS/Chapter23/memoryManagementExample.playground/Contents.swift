import UIKit

class User{
    let name : String
    private(set) var phones : [Phone] = []
    
    func add(phone : Phone){
        phones.append(phone)
        phone.owner = self
    }
    init(name : String) {
        self.name = name
        print("User \(name) is initialized")
    }
    
    deinit {
        print("Deallocated user \(name)")
    }
}

do {
    let _ = User(name: "Thao Nguyen")
}

class Phone{
    let model : String
    var owner : User?
    
    init(model : String) {
        self.model = model
        print("Model \(model) is initialized")
    }
    
    deinit {
        print("Deallocated model \(model)")
    }
}
do{
    let iphone = Phone(model: "iPhone7")
}
