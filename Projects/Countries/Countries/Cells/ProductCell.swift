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
    @IBOutlet weak var likeButton: UIButton!
    
    var product: Product? = nil
    
    private lazy var setupOnce: Void = {
        contentView.layer.cornerRadius = 12.0
        contentView.layer.masksToBounds = true

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
         
        _ = setupOnce
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func likePressed(_ sender: UIButton) {
        if let realProduct = product {
            if realProduct.isLiked {
                likeButton.setImage(#imageLiteral(resourceName: "emptyLike"), for: .normal)
                product!.isLiked = false
            } else {
                likeButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
                product!.isLiked = true
            }
        }
    }
    
    func configure(product: Product){
        self.productName?.text = product.productName
        self.productImage?.image = product.productImage
        self.product = product
    }
}
