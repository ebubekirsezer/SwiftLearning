//
//  ArticleTableViewCell.swift
//  GoodNews
//
//  Created by Ebubekir Sezer on 28.08.2021.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var descriptionLabel: UILabel?
    
    func setupCell(with article: Article?) {
        titleLabel?.text = article?.title
        descriptionLabel?.text = article?.description
    }
}
