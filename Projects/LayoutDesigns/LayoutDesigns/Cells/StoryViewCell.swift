//
//  StoryViewCell.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 6.01.2021.
//

import UIKit

class StoryViewCell: UICollectionViewCell {

    @IBOutlet private weak var storyImage: CustomImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(image: UIImage){
        storyImage.image = image
    }

}
