
import Foundation
import Combine

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum APIError: Error {
    case networkError(error: String)
    case responseError(error: String)
    case unknownError
}

let samplePost = Post(userId: 1, id: 2, title: "No Post", body: "")

//(1) Create a dataTaskPublisher
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
let publisher = URLSession.shared.dataTaskPublisher(for: url!)
    .map{ $0.data }
    .decode(type: [Post].self, decoder: JSONDecoder())

//(2) Subscribe to the publisher with mapError Error Handling
let cancellableSink = publisher
    .retry(2)
    .mapError({ error -> Error in
        switch error {
        case URLError.cannotFindHost:
            return APIError.networkError(error: error.localizedDescription)
        default:
            return APIError.responseError(error: error.localizedDescription)
        }
    })
    .sink { completion in
        print(String(describing: completion))
    } receiveValue: { value in
        print("returned value \(value)")
    }

//(3) A simple Publisher example with tryMap and catch
Just(7)
    .tryMap { _ in
        throw APIError.unknownError
    }
    .catch { result in
        Just(2)
    }
    .sink { value in
        print(value)
    }
