//
//  AppContainer.swift
//  MovieBoxVIPER
//
//  Created by Ebubekir Sezer on 27.06.2021.
//

import Foundation
import MovieBoxAPI

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = TopMoviesService()
}
