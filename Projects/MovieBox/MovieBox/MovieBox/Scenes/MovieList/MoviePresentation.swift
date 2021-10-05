//
//  MoviePresentation.swift
//  MovieBox
//
//  Created by Ebubekir Sezer on 9.06.2021.
//

import Foundation
import MovieBoxAPI

final class MoviePresentation: NSObject {
    let title: String
    let detail: String
    
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
        super.init()
    }
}

extension MoviePresentation {
    
    convenience init(movie: Movie) {
        self.init(title: movie.name, detail: movie.artistName)
    }
}
