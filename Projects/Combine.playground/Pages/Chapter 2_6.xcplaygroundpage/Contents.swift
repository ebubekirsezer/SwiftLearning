
import Foundation
import Combine

//(1) A simple publisher using Just, to produce once to each subsriber, before 💀
let _ = Just("A data stream")
    .sink { value in
        print("value is \(value)")
    }

//(2) Connect subject to a publisher, and publish the value 29
let subject = PassthroughSubject<Int, Never>()

Just(29)
    .subscribe(subject)

//(3) A simple use of Future, in a function
enum FutureError: Error {
    case notMultiple
}

let future = Future<String, FutureError> { promise in
    let calendar = Calendar.current
    let second = calendar.component(.second, from: Date())
    print("second is \(second)")
    
    if second.isMultiple(of: 17) {
        promise(.success("We are successful: \(second)"))
    } else {
        promise(.failure(.notMultiple))
    }
}.catch({ error in
    Just("Caught the error")
})
.delay(for: .init(1), scheduler: RunLoop.main)
.eraseToAnyPublisher()

future.sink { completion in
    print("Completion \(completion)")
} receiveValue: { value in
    print("Value \(value)")
}

