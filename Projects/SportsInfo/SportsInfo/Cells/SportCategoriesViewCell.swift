//
//  SportCategoriesViewCell.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 18.01.2021.
//

import UIKit

class SportCategoriesViewCell: UICollectionViewCell {

    @IBOutlet private weak var sportCategoryImage: CustomImageView!
    @IBOutlet private weak var sportCategoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWith(sport: Sport){
        sportCategoryImage.downloadImage(imageUrl: sport.strSportThumb)
        if sport.strSport != "Soccer"{
            sportCategoryName.text = sport.strSport
        }
    }
}
