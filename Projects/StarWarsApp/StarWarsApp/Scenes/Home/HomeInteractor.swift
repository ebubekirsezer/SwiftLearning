//
//  HomeInteractor.swift
//  StarWarsApp
//
//  Created by Ebubekir Sezer on 6.04.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeBusinessLogic
{
  func getCharacters(request: Home.StarWars.Request)
}

protocol HomeDataStore
{
    var characters: [StarWarsCharacter]? { get }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore
{
    var characters: [StarWarsCharacter]?
    
    var presenter: HomePresentationLogic?
    var worker = HomeWorker(starWarsStore: StarWarsAPI())
    //var name: String = ""
    
    // MARK: Do something
    
    func getCharacters(request: Home.StarWars.Request)
    {
        worker.getCharacters(completion: { (characters, error) in
            if error != nil {
                
            } else {
                self.characters = characters.results
                let response = Home.StarWars.Response(characters: characters.results)
                self.presenter?.presentCharacters(response: response)
            }
        })
    }
}