//
//  ArticleTableViewCell.swift
//  NewsAppMVVM
//
//  Created by Ebubekir Sezer on 29.08.2021.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setupCell(with article: Article?) {
        titleLabel.text = article?.title ?? ""
        descriptionLabel.text = article?.description ?? ""
    }
}
