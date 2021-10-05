import Dispatch

func fetchValue() -> Int {
    let value = Int.random(in: 1...2)
    
    sleep(UInt32(value))
    return value
}

let group = DispatchGroup()

let concurrentQueue = DispatchQueue(label: "com.ebubekirsezer.concurrent", attributes: .concurrent)
let secondQueue = DispatchQueue(label: "com.ebubekirsezer.second")

var a = 0, b = 0, c = 0, d = 0

concurrentQueue.async(group: group) {
    a = fetchValue()
}

concurrentQueue.async(group: group) {
    b = fetchValue()
}

concurrentQueue.async(group: group) {
    c = fetchValue()
}

secondQueue.async {
    d = fetchValue()
}

let timeoutSeconds = DispatchTimeInterval.seconds(3)
if group.wait(timeout: .now() + timeoutSeconds) == .success {
    let x = a + b + c + d
    print("x = \(x) (\(a) + \(b) + \(c) + \(d))")

    let result = x % 2 == 0 ? x * fetchValue() : -x
    print(result)
} else {
    print("Error! Couldn't finish computations in \(timeoutSeconds)")
}

//group.notify(queue: .main) {
//    let x = a + b + c + d
//    print("x = \(x) (\(a) + \(b) + \(c) + \(d))")
//
//    let result = x % 2 == 0 ? x * fetchValue() : -x
//    print(result)
//}
//
//print("HERE")
