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
    @IBOutlet weak var backButton: CustomUIButton!
    
    var product: Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productImage.image = product?.productImage
        productName.text = product?.productName
        backButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    @IBAction func backButtonPressed(_ sender: CustomUIButton) {
        dismiss(animated: true, completion: nil)
    }
}
