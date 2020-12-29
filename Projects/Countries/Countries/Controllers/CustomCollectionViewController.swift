//
//  CustomCollectionViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 29.12.2020.
//

import UIKit

class CustomCollectionViewController: UIViewController {
    
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var buttonOrderList: UIButton!
    @IBOutlet weak var buttonFilterList: UIButton!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    
    let products: [Product] = [
        Product(productImage: #imageLiteral(resourceName: "istanbul"), productName: "Asus Laptop"),
        Product(productImage: #imageLiteral(resourceName: "erzurum"), productName: "Acer Laptop"),
        Product(productImage: #imageLiteral(resourceName: "edirne"), productName: "Apple Laptop"),
        Product(productImage: #imageLiteral(resourceName: "sakarya"), productName: "HP Laptop"),
        Product(productImage: #imageLiteral(resourceName: "kocaeli"), productName: "Monster Laptop"),
        Product(productImage: #imageLiteral(resourceName: "istanbul"), productName: "Lenovo Laptop"),
        Product(productImage: #imageLiteral(resourceName: "istanbul"), productName: "Dell Laptop"),
        Product(productImage: #imageLiteral(resourceName: "malatya"), productName: "IBM Laptop"),
        Product(productImage: #imageLiteral(resourceName: "erzurum"), productName: "Alienware Laptop"),
        Product(productImage: #imageLiteral(resourceName: "erzurum"), productName: "Gaming Laptop"),
        Product(productImage: #imageLiteral(resourceName: "edirne"), productName: "Tulpar Laptop"),
        Product(productImage: #imageLiteral(resourceName: "istanbul"), productName: "Abra Laptop"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productCollectionView.dataSource = self
        
        let productCell = UINib(nibName: "ProductCell", bundle: nil)
        productCollectionView.register(productCell, forCellWithReuseIdentifier: "ProductCell")
        
        filterView.layer.cornerRadius = filterView.bounds.height / 4
        
        buttonOrderList.setImage(UIImage(systemName: "infinity"), for: .normal)
        buttonOrderList.tintColor = UIColor.black
        buttonOrderList.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: buttonOrderList.bounds.height)
        
        buttonFilterList.setImage(UIImage(systemName: "shuffle"), for: .normal)
        buttonFilterList.tintColor = UIColor.black
        buttonFilterList.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: buttonFilterList.bounds.height)
    }
}

extension CustomCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let productName = products[indexPath.row].productName
        let productImage = products[indexPath.row].productImage
        
        cell.configure(name: productName, image: productImage)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
}



