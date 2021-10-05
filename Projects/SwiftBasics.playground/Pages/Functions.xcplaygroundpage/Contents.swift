
import Foundation

func printHello() {
    print("Hello")
}

printHello()


func addPrefixToName(name: String, isMale: Bool) -> String {
    if isMale {
        return "Mr. \(name)"
    } else {
        return "Mrs. \(name)"
    }
}


var maleName = addPrefixToName(name: "Charles", isMale: true)
print(maleName)

var femaleName = addPrefixToName(name: "Elizabeth", isMale: false)
print(femaleName)
