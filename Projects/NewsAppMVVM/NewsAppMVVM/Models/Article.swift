//
//  Article.swift
//  NewsAppMVVM
//
//  Created by Ebubekir Sezer on 29.08.2021.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]?
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
