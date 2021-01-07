//
//  StoryViewCell.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 6.01.2021.
//

import UIKit

class StoryViewCell: UICollectionViewCell {
    

    @IBOutlet private weak var storyImage: CustomizedImageView!
    @IBOutlet private weak var storyUserName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWith(person: Person){
        storyImage.image = person.profilePicture
        storyUserName.text = person.username
    }
}
