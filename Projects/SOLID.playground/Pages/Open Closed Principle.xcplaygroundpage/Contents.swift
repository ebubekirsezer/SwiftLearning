//: [Previous](@previous)

import Foundation

protocol PaymentManagerProtocol {
    func payAmount(_ amount: Decimal, method: PaymentMethodProtocol)
}

protocol PaymentMethodProtocol {
    func payAmount(_ amount: Decimal)
}

class VisaPaymentMethod: PaymentMethodProtocol {
    func payAmount(_ amount: Decimal) {
        //...
    }
}

class MasterCardPaymentMethod: PaymentMethodProtocol {
    func payAmount(_ amount: Decimal) {
        //...
    }
}

class AppleWalletPaymentMethod: PaymentMethodProtocol {
    func payAmount(_ amount: Decimal) {
        //....
    }
}
