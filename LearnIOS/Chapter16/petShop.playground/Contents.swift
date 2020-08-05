import UIKit

protocol Feedable{
    func feed()
}

protocol Cleanable{
    func clean()
}

protocol Tankable : Cleanable{
    func tank()
}


protocol Cageable : Cleanable{
    func cage()
}

protocol Walkable{
    func walk()
}

class Dog : Feedable, Walkable{
    func feed(){
        print("The dog is fed")
    }
    
    func walk() {
        print("The dog is walked")
    }
}

class Cat : Feedable, Walkable{
    func feed() {
        print("The cat is fed")
    }
    
    func walk() {
        print("The cat is walked")
    }
}

class Fish : Feedable, Tankable{
    func feed() {
        print("The fish is fed")
    }
    
    func tank() {
        print("The fish is tank")
    }
    
    func clean() {
        print("The tank is cleaned")
    }
}

class Bird : Feedable, Cageable{
    func feed() {
        print("The bird is fed")
    }
    
    func cage() {
        print("The bird is cage")
    }
    
    func clean() {
        print("The cage is cleaned")
    }
}

var dog : Dog = Dog()
var cat : Cat = Cat()
var bird : Bird = Bird()
var fish : Fish = Fish()

var feedPets : [Feedable] = [dog, cat, bird, fish]
var tankPets : [Tankable] = [fish]
var cagePets : [Cageable] = [bird]
var walkPets : [Walkable] = [dog, cat]

for pet in feedPets{
    pet.feed()
}

for pet in tankPets{
    pet.tank()
    pet.clean()
}

for pet in walkPets{
    pet.walk()
}

for pet in cagePets{
    pet.cage()
    pet.clean()
}
