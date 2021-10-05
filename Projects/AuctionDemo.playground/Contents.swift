import UIKit

//protocol Observer {
//    associatedtype Notification
//    func update(notification: Notification)
//}
//
//protocol Subject {
//    associatedtype O: Observer
//    mutating func attach(observer: O)
//    mutating func detach(observer: O)
//    func notifyObservers()
//}

struct Bidder {
    var id: String
    
    init(id: String) {
        self.id = id
        NotificationCenter.default.addObserver(forName: NSNotification.Name(BidNotificationNames.bidNotification), object: nil, queue: nil) { notification in
            if let userInfo = notification.userInfo,
               let bidValue = userInfo["bid"] as? Float,
               let message = userInfo["message"] as? String {
                print("\t\(id) new bid is \(bidValue) \(message)")
            }
        }
    }
}

struct BidNotificationNames {
    static let bidNotification = "bidNotification"
}

struct BidNotification {
    var bid: Float
    var message: String?
}

struct Auctiooner {
    private var bidders = [Bidder]()
    
    private var auctionEnded: Bool = false
    private var currentBid: Float = 0
    private var reservePrice: Float = 0
    
    var bid: Float {
        set {
            if auctionEnded {
                print("\nAuction ended. We don't accept new bids")
            } else if newValue > currentBid {
                print("\nNew bid $\(newValue) accepted")
                if newValue >= reservePrice {
                    print("Reserve price met! Auction ended")
                    auctionEnded = true
                }
                
                currentBid = newValue
                let message = bid > reservePrice ? "Reserve met, item sold" : ""
                let notification = Notification(name: Notification.Name(BidNotificationNames.bidNotification), object: nil, userInfo: ["bid": bid, "message": message])
                NotificationCenter.default.post(notification)
            }
        }
        get {
            return currentBid
        }
    }
    
    
    
    init(initialBid: Float = 0, reservePrice: Float = 0) {
        self.bid = initialBid
        self.reservePrice = reservePrice
    }
}


var auctioneer = Auctiooner(reservePrice: 550)

let bidder1 = Bidder(id: "Joe")
let bidder2 = Bidder(id: "Quinn")
let bidder3 = Bidder(id: "Sal")
let bidder4 = Bidder(id: "Murr")

//auctioneer.attach(observer: bidder1)
//auctioneer.attach(observer: bidder2)
//auctioneer.attach(observer: bidder3)
//auctioneer.attach(observer: bidder4)


auctioneer.bid = 100
auctioneer.bid = 150

//auctioneer.detach(observer: bidder1)
NotificationCenter.default.removeObserver(bidder1)
auctioneer.bid = 300

auctioneer.bid = 550
