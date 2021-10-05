import UIKit

protocol Visitor {
    func visit(item: Book)
    func visit(item: Computer)
    func visit(item: Car)
}

protocol Product {
    func accept(visitor: Visitor)
}

protocol CommonAttributes {
    var price: Float { get }
}

struct Book {
    var isbn: String
    var title: String
    var itemPrice: Float
}

struct Computer {
    var serialNumber: String
    var brand: String
    var unitPrice: Float
}

struct Car {
    var ean: String
    var make: String
    var model: String
    var stickerPrice: Float
}

extension Book: CommonAttributes {
    var price: Float {
        return itemPrice
    }
}

extension Computer: CommonAttributes {
    var price: Float {
        return unitPrice
    }
}

extension Car: CommonAttributes {
    var price: Float {
        return stickerPrice
    }
}

let book = Book(isbn: "178-4-19-155607-9", title: "Swift Design Patterns", itemPrice: 30)
let macBook = Computer(serialNumber: "12345-00", brand: "Apple MacBook Pro", unitPrice: 2500)
let teslaS = Car(ean: "1KL4KXBG0AF148193", make: "Tesla", model: "S", stickerPrice: 69200)

var shoppingCart = [CommonAttributes]()
shoppingCart.append(contentsOf: [book, macBook, teslaS] as [CommonAttributes])

func calculateTotalPrice(items: [CommonAttributes]) -> Float {
    
    var price: Float = 0
    
    for item in items {
        price += item.price
    }
    
    return price
    
//    let priceVisitor = PriceVisitor()
//
//    for item in items {
//        item.accept(visitor: priceVisitor)
//    }
//
//    return priceVisitor.totalPrice
}

//print(calculateTotalPrice(items: shoppingCart as! [Product]))
print(calculateTotalPrice(items: shoppingCart))




extension Book: Product {
    func accept(visitor: Visitor) {
        visitor.visit(item: self)
    }
}

extension Computer: Product {
    func accept(visitor: Visitor) {
        visitor.visit(item: self)
    }
}

extension Car: Product {
    func accept(visitor: Visitor) {
        visitor.visit(item: self)
    }
}

class PriceVisitor: Visitor {
    
    var totalPrice: Float = 0
    
    func visit(item: Book) {
        totalPrice += item.itemPrice
    }
    
    func visit(item: Computer) {
        totalPrice += item.unitPrice
    }
    
    func visit(item: Car) {
        totalPrice += item.stickerPrice
    }
}
