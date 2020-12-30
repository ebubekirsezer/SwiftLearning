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
    @IBOutlet weak var productListView: UICollectionView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var constraintHeightForHeaderView: NSLayoutConstraint!
    
    var showingTopViews = false
    
    let products: [Product] = ProductSource.products
    
    var filteredProducts: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productListView.delegate = self
        productListView.dataSource = self
        searchBar.delegate = self
        
        //Hiding Navigation Bar
        //self.navigationController?.hidesBarsOnSwipe = true
        
        filteredProducts = products
        
        registerCellToCollectionView()
        updateUI()
    }
    
    func updateUI(){
        filterView.layer.cornerRadius = filterView.bounds.height / 4
        
        buttonOrderList.setImage(UIImage(systemName: "infinity"), for: .normal)
        buttonOrderList.tintColor = UIColor.black
        buttonOrderList.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: buttonOrderList.bounds.height)
        
        buttonFilterList.setImage(UIImage(systemName: "shuffle"), for: .normal)
        buttonFilterList.tintColor = UIColor.black
        buttonFilterList.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: buttonFilterList.bounds.height)
    }
    
    func registerCellToCollectionView(){
        let productCell = UINib(nibName: "ProductCell", bundle: nil)
        productListView.register(productCell, forCellWithReuseIdentifier: "ProductCell")
    }
}

extension CustomCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let product = filteredProducts[indexPath.row]
        cell.configure(product: product)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productDetailVC = storyboard.instantiateViewController(identifier: "ProductDetailViewController") as! ProductDetailViewController
        let product = filteredProducts[indexPath.row]
        productDetailVC.product = product
        
        productDetailVC.modalPresentationStyle = .popover
        productDetailVC.modalTransitionStyle = .coverVertical
        show(productDetailVC, sender: self)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print(scrollView.contentSize.height) 1800
        let offsetY = scrollView.contentOffset.y
        if offsetY > 150 {
            self.constraintHeightForHeaderView.constant = 0
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
            
        } else {
            self.constraintHeightForHeaderView.constant = 150
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
        }
    }
}

extension CustomCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width / 2, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension CustomCollectionViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredProducts = []
        
        if searchText == ""{
            filteredProducts = products
        } else {
            for product in products {
                if product.productName.lowercased().contains(searchText.lowercased()) {
                    filteredProducts.append(product)
                }
            }
        }
        
        self.productListView.reloadData()
    }
}

