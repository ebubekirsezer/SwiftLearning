//
//  AppContainer.swift
//  MovieBox
//
//  Created by Ebubekir Sezer on 9.06.2021.
//

import Foundation
import MovieBoxAPI

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = TopMoviesService()
}
