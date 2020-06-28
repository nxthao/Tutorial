import UIKit

struct LightBulb{
    static var maxCurrent = 40
    var isOn = false
    var current = 0{
        willSet{
            if newValue > LightBulb.maxCurrent{
                print("The current: \(newValue) amps is high, Should turn off the light.")
                isOn = false
            }
        }
        
        didSet{
            if current > LightBulb.maxCurrent{
                print("The current: \(current) amps is high, Please change to old current!")
                current = oldValue
            }
        }
    }
}

var light1 = LightBulb(isOn: true, current: 20)
print("Current light: \(light1.current) amps")
print("Status of the light: \(light1.isOn)")
light1.current = 50
print("Current light: \(light1.current) amps")
