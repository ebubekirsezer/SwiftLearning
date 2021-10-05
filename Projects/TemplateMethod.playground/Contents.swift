import UIKit

struct Contacts: Encodable {
    var contacts: [Contact]
}

struct Contact: Encodable {
    var firstName: String
    var lastName: String
    var phone: String
}

protocol PrettyPrintable {
    func display<Value: Encodable>(context: Value) -> String?
    func encodeHook<Value: Encodable>(context: Value) -> Data?
    func formattedString(data: Data) -> String?
    func displayHook(text: String)
}


extension PrettyPrintable {
    func display<Value: Encodable>(context: Value) -> String? {
        guard let encodedData = encodeHook(context: context),
              let formattedString = formattedString(data: encodedData) else {
            return nil
        }
        
        displayHook(text: formattedString)
        return formattedString
    }
    
    func encodeHook<Value: Encodable>(context: Value) -> Data? {
        return nil
    }
    
    func formattedString(data: Data) -> String? {
        return String(data: data, encoding: .utf8)
    }
    
    func displayHook(text: String) {
        print(text)
    }
}

class JSONDisplayable: PrettyPrintable {
    
    lazy var jsonEncoder = JSONEncoder()
    
    func encodeHook<Value>(context: Value) -> Data? where Value : Encodable {
        let jsonData = try? jsonEncoder.encode(context)
        return jsonData
    }
}

class XMLDisplayable: PrettyPrintable {
    
    lazy var pListEncoder: PropertyListEncoder = {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = PropertyListSerialization.PropertyListFormat.xml
        return encoder
    }()
    
    func encodeHook<Value>(context: Value) -> Data? where Value : Encodable {
        let pListData = try? pListEncoder.encode(context)
        return pListData
    }
}

let jony = Contact(firstName: "Jony", lastName: "Ive", phone: "555-5555")
let steve = Contact(firstName: "Steve", lastName: "Applese", phone: "444-4444")

var contacts = Contacts(contacts: [jony, steve])

let xmlDisplayer = XMLDisplayable()
xmlDisplayer.display(context: contacts)

let jsonDisplayer = JSONDisplayable()
jsonDisplayer.display(context: contacts)
