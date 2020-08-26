import UIKit

protocol MobileOS{
    associatedtype Version
    var version : Version { get }
    init(version : Version)
}

struct IOS : MobileOS{
    var version : Float
}

struct Android : MobileOS{
    var version : String
}

func buildPreferredOS() -> some MobileOS{
    return IOS(version: 13.5)
}

let iphone = buildPreferredOS()
print("OS version: \(iphone)")
