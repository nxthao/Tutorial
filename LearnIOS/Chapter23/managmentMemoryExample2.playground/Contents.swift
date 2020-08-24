import UIKit

print("Weak referrence and unknow")

class User{
    let name : String
    private(set) var phones : [Phone] = []
    var subscriptions : [CarrierSubscription] = []
    
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
    // Weak referrence
    weak var owner : User?
    var carrierSubscription : CarrierSubscription?
    
    func provision(carrierSubscription : CarrierSubscription){
        self.carrierSubscription = carrierSubscription
    }
    
    func decommission(){
        carrierSubscription = nil
    }
    
    init(model : String) {
        self.model = model
        print("Model \(model) is initialized")
    }
    
    deinit {
        print("Deallocated model \(model)")
    }
}

class CarrierSubscription{
    let name : String
    let countryCode : String
    let number : String
    unowned let user : User
    
    init(name : String, countryCode : String, number : String, user : User) {
        self.name = name
        self.countryCode = countryCode
        self.number = number
        self.user = user
        user.subscriptions.append(self)
        
        print("Carrier Subscription \(name) is initialized")
    }
    
    deinit {
        print("Deallocating Carrier subscription \(name)")
    }
}

do{
    let user = User(name: "Thao Nguyen")
    let iphone = Phone(model: "iPhone7")
    user.add(phone: iphone)
    let subscription = CarrierSubscription(
        name: "Viettel",
        countryCode: "84", number: "987654321", user: user
    )
    iphone.provision(carrierSubscription: subscription)
}
