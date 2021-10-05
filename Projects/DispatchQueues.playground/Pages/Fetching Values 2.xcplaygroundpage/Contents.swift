import Dispatch

func fetchValue(group: DispatchGroup, completion: @escaping (Int) -> ()) {
    group.enter()
    DispatchQueue.global(qos: .background).async {
        let value = Int.random(in: 1...2)
        sleep(UInt32(value))
        completion(value)
        group.leave()
    }
}

let group = DispatchGroup()

let concurrentQueue = DispatchQueue(label: "com.ebubekirsezer.concurrent", attributes: .concurrent)
let secondQueue = DispatchQueue(label: "com.ebubekirsezer.second")

var a = 0, b = 0, c = 0, d = 0

concurrentQueue.async(group: group) {
    fetchValue(group: group) { value in
        a = value
    }
}

concurrentQueue.async(group: group) {
    fetchValue(group: group) { value in
        b = value
    }
}

concurrentQueue.async(group: group) {
    fetchValue(group: group) { value in
        c = value
    }
}


secondQueue.async(group: group) {
    fetchValue(group: group) { value in
        d = value
    }
}

group.notify(queue: .main) {
    let x = a + b + c + d
    print("x = \(x) (\(a) + \(b) + \(c) + \(d))")
}
