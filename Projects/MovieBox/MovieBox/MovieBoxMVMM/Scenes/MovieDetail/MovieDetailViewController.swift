//
//  MovieDetailViewController.swift
//  MovieBoxMVMM
//
//  Created by Ebubekir Sezer on 12.06.2021.
//

import Foundation
import UIKit

final class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var artistLabel: UILabel?
    @IBOutlet private weak var genreLabel: UILabel?
    
    var viewModel: MovieDetailViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.load()
    }
}

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    func showDetail(_ presentation: MovieDetailPresentation) {
        self.titleLabel?.text = presentation.title
        self.artistLabel?.text = presentation.artistName
        self.genreLabel?.text = presentation.genre
    }
}
