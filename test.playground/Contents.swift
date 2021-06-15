
func minMax(array: [Int]) -> (min: Int?, max: Int?, sum: Int?, average: Int?) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (min: currentMin, max: currentMax, sum: nil, average: nil)
}

var myTuples = minMax(array: [1,2,3,15,40])
myTuples.min
myTuples.max

func greet(person: String, homewtown: String = "istanbul") -> String {
    return "Hello \(person)!  Glad you could visit from \(homewtown)."
}

func sum(_ myDouble: inout Double, _ myDouble2: inout Double){
    var temp : Double = myDouble
    myDouble = myDouble2
    myDouble2 = temp
}

var x : Double = 5
var y : Double = 10
sum(&x, &y)

print("x: \(x) y: \(y)")
