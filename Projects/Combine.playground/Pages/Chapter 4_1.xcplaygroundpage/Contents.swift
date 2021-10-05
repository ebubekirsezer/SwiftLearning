
import Foundation
import Combine

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

print("Publisher: On main thread?: \(Thread.current.isMainThread)")
print("Publisher: thread info: \(Thread.current)")

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
let queue = DispatchQueue(label: "a queue")

let publisher = URLSession.shared.dataTaskPublisher(for: url!)
    .map { $0.data }
    .decode(type: [Post].self, decoder: JSONDecoder())

let cancellableSink = publisher
    .subscribe(on: DispatchQueue(label: " A queue")) 
    //.receive(on: DispatchQueue.main)
    .sink { completion in
        print("Subscriber: On main thread?: \(Thread.current.isMainThread)")
        print("Subscriber: thread info: \(Thread.current)")
    } receiveValue: { value in
        print("Subscriber: On main thread?: \(Thread.current.isMainThread)")
        print("Subscriber: thread info: \(Thread.current)")
    }

