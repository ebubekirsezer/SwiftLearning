//
//  ProductDetailViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 30.12.2020.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    var product: Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productImage.image = product?.productImage
        productName.text = product?.productName
    }
}
