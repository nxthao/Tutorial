import UIKit

class A
{
    init() {
        print("Init A!")
    }
    
    deinit {
        print("Deinit A!")
    }
}

class B : A{
    override init() {
        print("Init B (1)!")
        super.init()
        print("Init B (2)!")
    }
    
    deinit {
        print("Deinit B")
    }
}

class C : B{
    override init() {
        print("Init C (1)!")
        super.init()
        print("Init C (2)!")
    }
    
    deinit {
        print("Deinit C")
    }
}

do{
    let c = C()
    let _ = c as A
}
