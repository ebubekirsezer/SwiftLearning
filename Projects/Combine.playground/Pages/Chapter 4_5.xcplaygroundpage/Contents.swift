
import Foundation
import Combine

let numbers = (1...20)
    .publisher

let numbersTwo = (21...40)
    .publisher

let words = (21...40).compactMap { String($0) }
    .publisher

let cancellableSink = numbers
    //.filter { $0 % 2 == 0 }
    //.compactMap { Float($0) }
    //.first()
    //.last(where: { $0 < 20} )
    //.dropFirst()
    //.drop(while: { $0 % 3 == 0 })
    //.prefix(4)
    //.prefix(while: {$0 < 5})
    //.append(21, 22, 23)
    //.prepend(21 ,22, 23)
    //.merge(with: numbersTwo)
    //.combineLatest(words)
    //.zip(numbersTwo)
    //.collect()
    .throttle(for: .seconds(2), scheduler: DispatchQueue.main, latest: false)
    .sink {print($0)}
