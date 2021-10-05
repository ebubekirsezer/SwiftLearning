
import Foundation
import Combine

[1, 5, 9]
    .publisher
    .map({ $0 * $0 })
    .sink { print($0) }

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

struct Task: Decodable {
    let id: Int
    let title: String
    let userId: Int
    let body: String
}

let dataPublisher = URLSession.shared.dataTaskPublisher(for: url)
    .map({ $0.data })
    .decode(type: [Task].self, decoder: JSONDecoder())

let cancellableSink = dataPublisher
    .sink { completion in
        print(completion)
    } receiveValue: { items in
        print("Result \(items.first?.title ?? "")")
    }

