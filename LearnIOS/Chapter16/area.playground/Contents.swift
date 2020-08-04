import UIKit

protocol Area{
    var area : Double { get }
}

struct Square : Area{
    let side : Double
    var area: Double {
        self.side * self.side
    }
}

struct Triangle : Area{
    let high : Double
    let base : Double
    var area: Double {
        0.5 * self.high * self.base
    }
}

struct Circle : Area{
    let radius : Double
    var area: Double{
        .pi * self.radius * self.radius
    }
}

let square = Square(side: 5)
print(square.area)

let triangle = Triangle(high: 2, base: 3)
print(triangle.area)

let circle = Circle(radius: 7)
print(circle.area)

var shapes : [Area] = [square, triangle, circle]
print(shapes.map{$0.area})


