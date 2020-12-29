//
//  ProductCell.swift
//  Countries
//
//  Created by Ebubekir Sezer on 29.12.2020.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var buttonLike: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonLikePressed(_ sender: UIButton) {
    }
    
    
    func configure(name: String, image: UIImage){
        self.productName?.text = name
        self.productImage?.image = image
    }
}
