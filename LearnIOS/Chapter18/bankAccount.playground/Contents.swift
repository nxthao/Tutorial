import UIKit

protocol Account{
    associatedtype Currency
    var balance : Currency {get}
    func withdraw(amount : Currency)
    func deposit(amount : Currency)
}
