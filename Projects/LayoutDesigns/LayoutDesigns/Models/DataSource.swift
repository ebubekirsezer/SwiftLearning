//
//  DataSource.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 6.01.2021.
//

import UIKit

class DataSource {
    static let people: [Person] = [
        Person(username: "@ebubekirsezer", name: "Ebubekir", surname: "Sezer", profilePicture: #imageLiteral(resourceName: "whatsapp"), posts: [
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1),
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1),
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1)
        ]),
        Person(username: "@sjobs", name: "Steve", surname: "Jobs", profilePicture: #imageLiteral(resourceName: "whatsapp"), posts: [
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1)
        ]),
        Person(username: "@gates", name: "Bill", surname: "Gates", profilePicture: #imageLiteral(resourceName: "whatsapp"), posts: [
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1)
        ])
    ]
}
