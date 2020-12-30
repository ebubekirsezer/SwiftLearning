//
//  ProductDetailViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 30.12.2020.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var product: Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(product?.productName)
    }
}
