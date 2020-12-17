
class Person1{
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) initiazlized")
    }
    
    deinit {
        print("\(name) deinitialized")
    }
}

var reference1: Person1?
var reference2: Person1?
var reference3: Person1?

reference1 = Person1(name: "Ebubekir Sezer")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil

reference3 = nil


// Strong reference cycle

class Person{
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit {
        print("\(name) deinitialized")
    }
}

// To break the strong cycle we need to choose a weak
class Apartment{
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person?
    deinit {
        print("apartment \(unit) deinitialized")
    }
}

var ebu: Person?
var unit2B: Apartment?

ebu = Person(name: "Ebubekir")
unit2B = Apartment(unit: "2b")

ebu!.apartment = unit2B
unit2B!.tenant = ebu

ebu = nil
unit2B = nil

//Unowned
class Customer{
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) customer deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("card \(number) deinitialized")
    }
}

var john: Customer?
john = Customer(name: "John Appleseed")
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)

john = nil

// optional unowned

class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}

let department = Department(name: "Science")

let intro = Course(name: "Math", in: department)
let intermediate = Course(name: "Chemistry", in: department)
let advanced = Course(name: "Physics", in: department)

intro.nextCourse = intermediate
intermediate.nextCourse = advanced
department.courses = [intro, intermediate, advanced]


class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Turkey", capitalName: "Ankara")
print("Country: \(country.name), Capital name: \(country.capitalCity.name)")


// closure strong cycle
class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}

let heading = HTMLElement(name: "h1")
let defaultText = "default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())

paragraph = nil

// to prevent strong cycle on the closure we use capture list
//lazy var someClosure = {
//    [unowned self, weak delegate = self.delegate]
//    (index: Int, stringToProcess: String) -> String in
//}

//lazy var someClosure = {
//    [unowned self, weak delegate = self.delegate] in
//    // closure body goes here
//}

class HTMLElement2 {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        // Unowned self !!!!
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}

var paragraph2: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph2!.asHTML())

paragraph2 = nil
