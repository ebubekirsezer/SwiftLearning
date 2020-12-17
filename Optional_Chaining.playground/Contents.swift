
// Optional Chaining

class Person{
    var residence: Residence?
}

class Residence{
    var rooms = [Room]()
    var numberOfRooms: Int{
        return rooms.count
    }
    
    subscript(i: Int) -> Room{
        get{
            return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms(){
        print("number of rooms, \(numberOfRooms)")
    }
    var address: Address?
    
}

class Room{
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address{
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIndentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street{
                return "\(buildingNumber), \(street)"
        } else if buildingName != nil{
            return buildingName
        } else {
            return nil
        }
    }
}

let ebu = Person()
if let roomCount = ebu.residence?.numberOfRooms{
    print("Residence : \(roomCount)")
} else {
    print("Unable")
}

func createAddress() -> Address{
    print("Function called")
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Pirireis Sokak"
    return someAddress
}

ebu.residence?.address = createAddress()

if ebu.residence?.printNumberOfRooms() != nil {
    print("positive")
} else {
    print("negative")
}

if (ebu.residence?.address = createAddress()) != nil {
    print("possible to write address")
} else {
    print("not possible to write address")
}

if let firstRoomName = ebu.residence?[0] {
    print("first room name \(firstRoomName)")
} else {
    print("unable to retrieve first room name")
}

ebu.residence?[0] = Room(name: "Guess Room")

let ebusHouse = Residence()
ebusHouse.rooms.append(Room(name: "Living Room"))
ebusHouse.rooms.append(Room(name: "Kitchen"))
ebu.residence = ebusHouse

if let firstRoomName = ebu.residence?[0].name {
    print("first room name \(firstRoomName)")
} else {
    print("unable to retrieve first room name")
}

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

print(testScores)

let ebusAddress = Address()
ebusAddress.buildingName = "The Hasbak"
ebusAddress.street = "Pirireis"
ebu.residence?.address = ebusAddress

if let ebusStreet = ebu.residence?.address?.street {
    print("Ebu's street name \(ebusStreet)")
} else {
    print("unable to retrieve street address")
}

if let buildingIdentifier = ebu.residence?.address?.buildingIndentifier(){
    print("Ebu's building identifier \(buildingIdentifier)")
}

if let beginsWithThe = ebu.residence?.address?.buildingIndentifier()?.hasPrefix("The"){
    if beginsWithThe {
        print("ebu's building begins with \"The\".")
    } else {
        print("not begins with \"The\".")
    }
}

let john = Person()

//this throw error because its nil
//let roomCount = john.residence!.numberOfRooms

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms{
    print("Residence : \(roomCount)")
} else {
    print("Unable")
}


class Vehicle {
    var car : Car?
    var numberOfTyres: Int = 4
}

class Player {
    var vehicle: Vehicle?
}

class Car{
    var modelName: String?
}

var ebubekir = Player()
print(ebubekir.vehicle?.numberOfTyres)
ebubekir.vehicle = Vehicle()

if let numberOfTyre = ebubekir.vehicle?.numberOfTyres{
    print(numberOfTyre)
}

ebubekir.vehicle?.car = Car()
ebubekir.vehicle?.car?.modelName = "mercedes"
if let carName = ebubekir.vehicle?.car?.modelName{
    print("car name: \(carName)")
} else {
    print("unavle to reach car name")
}
