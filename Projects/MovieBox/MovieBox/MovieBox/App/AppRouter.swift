//
//  AppRouter.swift
//  MovieBox
//
//  Created by Ebubekir Sezer on 9.06.2021.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewController = MovieListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
