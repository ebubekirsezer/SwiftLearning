
import Foundation
import Combine

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

let samplePost = Post(userId: 1, id: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")

//(1) Create a dataTaskPublisher
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
let publisher = URLSession.shared.dataTaskPublisher(for: url!)
    .map( { $0.data } )
    .decode(type: [Post].self, decoder: JSONDecoder())

//(2) Subscribe to the publisher
let cancellableSink = publisher
    .sink { completion in
        print(String(describing: completion))
    } receiveValue: { value in
        print("returned value \(value)")
    }

