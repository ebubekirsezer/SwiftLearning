//
//  AppConstants.swift
//  MovieBoxMVMM
//
//  Created by Ebubekir Sezer on 12.06.2021.
//

import Foundation
import MovieBoxAPI

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = TopMoviesService()
}
