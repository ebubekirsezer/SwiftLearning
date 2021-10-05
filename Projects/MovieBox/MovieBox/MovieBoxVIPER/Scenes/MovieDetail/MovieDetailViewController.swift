//
//  MovieDetailViewController.swift
//  MovieBoxVIPER
//
//  Created by Ebubekir Sezer on 30.06.2021.
//

import UIKit

final class MovieDetailViewController: UIViewController, MovieDetailViewProtocol {
    
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var artistNameLabel: UILabel?
    @IBOutlet private weak var genreLabel: UILabel?
    
    var presenter: MovieDetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
    
    func update(_ presentation: MovieDetailPresentation) {
        titleLabel?.text = presentation.title
        artistNameLabel?.text = presentation.artistName
        genreLabel?.text = presentation.genre
    }
    
}
