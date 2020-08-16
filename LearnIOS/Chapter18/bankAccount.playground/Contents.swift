import UIKit
import Foundation

protocol Account{
    associatedtype Currency
    var balance : Currency {get}
    func withdraw(amount : Currency)
    func deposit(amount : Currency)
}

typealias Dollars = Double

class BasicAccount : Account{
    var balance : Dollars = 0.0
    
    func withdraw(amount: Dollars) {
        if amount < balance{
            balance -= amount
        }
        else{
            balance = 0
        }
    }
    
    func deposit(amount: Dollars) {
        balance += amount
    }
}

class CheckingAccount : BasicAccount{
    private var accountNumber = UUID().uuidString
    
    class Check{
        var account : String
        var amount : Dollars
        private(set) var cashed = false // it is difference with only private, it is the same internal??
        
        func cash(){
            cashed = true
        }
        
        init(account : CheckingAccount, amount : Dollars) {
            self.amount = amount
            self.account = account.accountNumber
        }
    }
    // check: sec money
    // Sender
    func writeCheck(amount : Dollars) -> Check?{
        guard balance > amount else {
            return nil
        }
        let check = Check(account: self, amount: amount)
        // Send check. So, the money in balance will decrease
        withdraw(amount: amount)
        return check
    }
    // Receiver
    func depositCheck(check : Check){
        // If money is sent, crashed will note : True
        guard !check.cashed else {
            return
        }
        print("Receieve check from account number: \(check.account)")
        deposit(amount: check.amount)
        check.cash()
    }
}

var johnAccount = CheckingAccount()
johnAccount.deposit(amount: 10000)
print("Balance of John: \(johnAccount.balance)$")
print("John would to send a check to Jahn.")
var check = johnAccount.writeCheck(amount: 3000)
print("Check is sent or not? \(String(describing: check?.cashed))")
var jahnAccount = CheckingAccount()
jahnAccount.depositCheck(check: check!)
print("Balance of John: \(johnAccount.balance)$")
print("Balance of Jane: \(jahnAccount.balance)$")
//print(johnAccount.accountNumber) //account number is inaccessible due to "private"
print("Check is sent or not? \(String(describing: check?.cashed))")
