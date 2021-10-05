import UIKit

public final class ATM {
    
    fileprivate var state: ATMState = IdleState()
    
    public func enter(pin: String) {
        state = EnterPINState(context: self)
        state.validate(pin: pin)
    }
    
    public func withDraw(amount: Float) -> Bool {
        return state.withdraw(amount: amount)
    }
}

fileprivate protocol ATMState {
    func validate(pin: String)
    func withdraw(amount: Float) -> Bool
    func transactionCompleted(success: Bool)
}

extension ATMState {
    
    func validate(pin: String) {
        print("\(#function) not implemented for \(self) state")
    }
    
    func withdraw(amount: Float) -> Bool {
        print("\(#function) not implemented for \(self) state")
        return false
    }
    
    func transactionCompleted(success: Bool) {
        print("\(#function) not implemented for \(self) state")
    }
}

fileprivate struct IdleState: ATMState { }

fileprivate struct EnterPINState: ATMState {
    
    var context: ATM
    
    func validate(pin: String) {
        
        guard pin == "1234" else {
            print("INVALID PIN")
            context.state = TransactionCompletedState(context: context)
            context.state.transactionCompleted(success: false)
            return
        }
        
        print("PIN OK")
        context.state = WithdrawState(context: context)
    }
}

fileprivate struct TransactionCompletedState: ATMState {
    
    var context: ATM
    
    func transactionCompleted(success: Bool) {
        var statusMessage = success ? "Transaction complete ..." : "Transaction failed.."
        statusMessage += " don't forget your card!"
        print(statusMessage)
        
        context.state = IdleState()
    }
}

fileprivate struct WithdrawState: ATMState {
    
    var context: ATM
    static var availableFunds: Float = 1000
    
    func withdraw(amount: Float) -> Bool {
        print("> Withdraw $\(amount)")
        
        guard amount > 0 else {
            print("Error! Enter a valid amount")
            context.state = TransactionCompletedState(context: context)
            context.state.transactionCompleted(success: false)
            return false
        }
        
        WithdrawState.availableFunds -= amount
        context.state = TransactionCompletedState(context: context)
        context.state.transactionCompleted(success: true)
        return true
    }
}

let atm = ATM()
atm.enter(pin: "1234")
atm.withDraw(amount: 5200)
