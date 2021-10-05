//
//  Article.swift
//  GoodNews
//
//  Created by Ebubekir Sezer on 28.08.2021.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]?
    
    enum CodingKeys: String, CodingKey {
        case articles = "articles"
    }
}

extension ArticleList {
    static var all: Resource<ArticleList> = {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=11c04779461040ada348e604f924f8a4") else {
            fatalError()
        }
        
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
    }
}
