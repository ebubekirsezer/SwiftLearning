

// Inheritance

class Vehicle{
    var currentSpeed = 0.0
    var description: String{
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise(){
        
    }
}

let someVehicle = Vehicle()
print(someVehicle.currentSpeed)

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("tandem: \(tandem.description)")

//overriding
class Train: Vehicle{
    override func makeNoise() {
        print("Ho Ho Ho")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle{
    var gear = 1
    override var description: String{
        return super.description + "in gear, \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 4
print("Car: \(car.description)")

class AutomaticCar: Car{
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed / 10.0) + 1
        }
        willSet{
            
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 45.0
print("Automatic car: \(automatic.description)")

//final prevents the overriding
