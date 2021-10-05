//
//  HomePresenter.swift
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

protocol HomePresentationLogic
{
    func presentCharacters(response: Home.StarWars.Response)
}

class HomePresenter: HomePresentationLogic
{
    weak var viewController: HomeDisplayLogic?
    
    func presentCharacters(response: Home.StarWars.Response)
    {
        var displayedCharacters: [Home.StarWars.ViewModel.DisplayedCharacters] = []
        
        for character in response.characters {
            let displayedCharacter = Home.StarWars.ViewModel.DisplayedCharacters(name: character.name, birthYear: character.birthYear)
            displayedCharacters.append(displayedCharacter)
        }
        let viewModel = Home.StarWars.ViewModel(displayedCharacters: displayedCharacters)
        viewController?.displayCharacters(viewModel: viewModel)
    }
}