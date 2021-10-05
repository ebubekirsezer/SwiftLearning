
import Dispatch
import Foundation

class TaggedValue<T> {
    
    private let accessControlQueue = DispatchQueue(label: "com.ebubekirsezer.accessControl", attributes: .concurrent)
    
    private var backingValue: T?
    
    private(set) var isSet: Bool = false
    var value: T? {
        
        set {
            accessControlQueue.sync(flags: .barrier) {
                backingValue = newValue
                print("Updating isSet and id.")
                isSet = true
                id = UUID().uuidString
            }
        }
        get {
            accessControlQueue.sync {
                backingValue
            }
        }
    }
    private(set) var id: String?
}

let writer = DispatchQueue(label: "com.ebubekirsezer.writer")

var taggedValue = TaggedValue<Int>()

writer.async {
    taggedValue.value = Int.random(in: 1...100)
}

repeat {
    // slightly delay between iterations
    usleep(1)
} while !taggedValue.isSet

assert(taggedValue.value != nil && taggedValue.id != nil, "Error, invalid values!")
print(taggedValue)
