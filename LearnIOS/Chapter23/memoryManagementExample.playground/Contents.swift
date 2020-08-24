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
    let user = User(name: "Thao Nguyen")
    let iphone = Phone(model: "iPhone7")
    // When I add user.add, it will have the link between user and iphone, it is unable to delocated
    //    User Thao Nguyen is initialized
    //    Model iPhone7 is initialized
    //    Deallocated model iPhone7
    //    Deallocated user Thao Nguyen
    //    user.add(phone: iphone)
    user.add(phone: iphone)
    //    User Thao Nguyen is initialized
    //    Model iPhone7 is initialized
}

