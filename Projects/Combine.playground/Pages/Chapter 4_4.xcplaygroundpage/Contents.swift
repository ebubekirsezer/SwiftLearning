
import Foundation
import Combine

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
let publisher = URLSession.shared.dataTaskPublisher(for: url!)
    .map { $0.data }
    .decode(type: [Post].self, decoder: JSONDecoder())
    .eraseToAnyPublisher()

let cancellableSink = publisher
    .sink { completion in
        print(String(describing: completion))
    } receiveValue: { value in
        print("returned value \(value)")
    }

