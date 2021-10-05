
/*
 Swift dili otomatik olarak değişkenin türünü belirler
 Eğer değişken türün belirtmek isterseniz : Değişken türü girebiirsiniz.
 */
var language = "Swift"
var year = 2021
var phone: String = "iOS"
var nextYear = year + 1
let floatPi: Float = 3.14
let doublePi = 3.1415926535897932384626
var subject = (lanauge: "Swift", readTime: 5)

print(language)
print("Subject: \(subject.lanauge)")
print("Read Time: \(subject.readTime) min")

//Collection Types

//Array
var oddNumbers = [1, 3, 5, 7, 9]
var languages: [String] = ["Swift", "Obj-C", "JavaScript", "Java"]


//Yeni element ekleniyor.
oddNumbers.append(11)
print(oddNumbers)
// Array deki ilk eleman languages.first veya languages[0] şeklinde alınabilir.
print("Programming Language \(languages[0])")

//Sondaki element Siliniyor
oddNumbers.removeLast()
print(oddNumbers)

//Array içerisindeki değer değiştiriliyor
oddNumbers[2] = 13
print(oddNumbers)

//Sets

var evenNumbers: Set<Int> = [0, 2, 4, 6, 8]
print("My Even Numbers: \(evenNumbers) count: \(evenNumbers.count)")

//Yeni element ekleniyor
evenNumbers.insert(10)
print(evenNumbers)

//Element'i girerek Set'den silinyor
evenNumbers.remove(6)
print(evenNumbers)

//Döngü içerisine alıp Set değerlerini basabiliriz.
for number in evenNumbers {
    print(number)
}

//Dictionaries
var countryCodes: [String: String] = ["Turkey": "TR", "England": "EN", "Germany": "GER"]
print("Turkey Country Code: \(countryCodes["Turkey"])")

//Döngü içerisinde eğer kodları basmak istersek for içerisinde gösterebiliriz
for key in countryCodes.keys {
    print(key)
}

for (key, value) in countryCodes {
    print("Key: \(key) Value: \(value)")
}

// Control Flows
var programmingLanguage = "Swift"

if programmingLanguage == "Swift" {
    print("Open Xcode")
} else if programmingLanguage == "Java" {
    print("Open Android Studio")
} else {
    print("Not Found")
}

programmingLanguage = "Java"

switch programmingLanguage {
case "Swift":
    print("Open Xcode")
case "Java":
    print("Open Android Studio")
default:
    print("Not Found")
}

// Loops

for number in evenNumbers {
    print(number)
}

var isFive = false
var index = 0

var isZero = false

print("Repeat While")
repeat {
    print(index)
    index += 1
} while index <= 5


print("While")
while isZero == false {
    if index == 0 {
        isZero = true
    } else {
        index -= 1
        print(index)
    }
}
