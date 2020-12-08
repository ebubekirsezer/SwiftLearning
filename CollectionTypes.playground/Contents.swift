// Collection Types

/*
 Arrays are ordered collection values
 Sets are unordered collections of unique values
 Dictionaries are unordered collections of key-value associations
 */


//Creating empty array
var someInts = [Int]()

someInts.append(2)

someInts = []
print("array count \(someInts.count) ")

//creating default array
var threeDoubles = Array(repeating: 0.0, count: 3)

var anotherThreeDoubls = Array(repeating: 12.3, count: 3)

var sixDobule = threeDoubles + anotherThreeDoubls
print(sixDobule)

//array literal
var shoppingList: [String] = ["eggs","milk","bread"]

var shoppingList2 = ["eggs","milk","bread"]

//Acessing and Modifiying array
print("count: \(shoppingList.count)")

if shoppingList.isEmpty{
    print("its empty")
} else {
    print("not empty")
}

//adding new item
shoppingList.append("computer")
shoppingList += ["chocolate"]
shoppingList += ["cips", "coke", "sugar"]

//retriveng and chaging values
var firstItem = shoppingList[0]

shoppingList[0] = "2 eggs"


//inserting with ranges
shoppingList[4...6] = ["banana","apple"]
print(shoppingList)

//inserting specific place
shoppingList.insert("ebubekir", at: 0)
print(shoppingList)

//removing item
let ebubekir = shoppingList.remove(at: 0)
print(shoppingList)
print(ebubekir)

//removing last item
let lastItem = shoppingList.removeLast()
print(lastItem)

//iterating array

for item in shoppingList{
    print(item)
}

//empty set
var lettters = Set<Character>()
print("count \(lettters.count)")

lettters.insert("a")
print(lettters)

lettters = []
print(lettters)

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip-Hop"]

var favoriteGenres2: Set = ["Rock", "Classical", "Hip-Hop"]

//accesing and modifying set
print("count of set: \(favoriteGenres.count)")

if favoriteGenres.isEmpty{
    print("its empty")
} else {
    print("not empty")
}

//adding new item
favoriteGenres.insert("Jazz")

//removing item can be return the value of the removed or it can be nil
if let removedItem = favoriteGenres.remove("Rock"){
    print(removedItem)
} else{
    print("not important")
}
//removeall will remove all items

//contains method
if favoriteGenres.contains("Funk"){
    print("good")
} else{
    print("not bad")
}

//iterating set
for genre in favoriteGenres{
    print(genre)
}

//sorted
for genre in favoriteGenres.sorted(){
    print(genre)
}

//set operations

var oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

print(oddDigits.union(evenDigits).sorted())

print(oddDigits.intersection(evenDigits).sorted())

print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())

print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true

//Dictionary

//empty dictionary
var namesOfIntegers = [Int:String]()

namesOfIntegers[12] = "ebubekir"
print(namesOfIntegers)

namesOfIntegers = [:]
print(namesOfIntegers)

//dictionary literal
var airports: [String:String] = ["YYZ": "Toronto", "DUB": "Dublin"]

//accessing and modifying
print("count: \(airports.count)")

if airports.isEmpty{
    print("its empty")
} else {
    print("not empty")
}

//adding new item
airports["LHR"] = "London"
print(airports)
//change value
airports["LHR"] = "London England"
print(airports)

//update value method return the old value and it also be nil
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
    print(oldValue)
}

if let airportName = airports["DUB"]{
    print(airportName)
} else{
    print("nil")
}

//remove a key value
airports["APL"] = "Apple International"
print(airports)
airports["APL"] = nil
print(airports)

//removeValue method also remove and return the removed value or nil

if let removedValue = airports.removeValue(forKey: "DUB"){
    print(removedValue)
} else{
    print("not removed")
}

//iterating dictionary
for (airportCode, airportName) in airports{
    print("Code: \(airportCode) Name: \(airportName)")
}

for code in airports.keys{
    print(code)
}

for name in airports.values{
    print(name)
}

let airportCodes = [String](airports.keys)
print(airportCodes)

let airportNames = [String](airports.values)
print(airportNames)
