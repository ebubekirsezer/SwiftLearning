//
//  StoryCell.swift
//  Countries
//
//  Created by Ebubekir Sezer on 30.12.2020.
//

import UIKit

class StoryCell: UICollectionViewCell {

    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var storyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.cornerRadius = 75
    }
    
    func configure(product: Product){
        self.storyImage?.image = product.productImage
    }
}
