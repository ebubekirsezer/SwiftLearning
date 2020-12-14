
// Optional Chaining

class Person{
    var residence: Residence?
}

class Residence{
    var numberOfRooms = 1
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
