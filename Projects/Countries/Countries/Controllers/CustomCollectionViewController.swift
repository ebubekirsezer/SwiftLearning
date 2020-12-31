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
    
    let products: [Product] = ProductSource.products
    var filteredProducts: [Product] = []
    var showingTopViews = false
    var selectedCell: ProductCell?
    var selectedCellImageViewSnapshot: UIView?
    var animator: Animator?
    
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
    
    @IBAction func orderListPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let orderListVC = storyboard.instantiateViewController(identifier: "OrderListViewController") as! OrderListViewController
        
        orderListVC.modalPresentationStyle = .overFullScreen
        orderListVC.modalTransitionStyle = .crossDissolve
        self.present(orderListVC, animated: false, completion: nil)
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
        
        selectedCell = collectionView.cellForItem(at: indexPath) as? ProductCell
        selectedCellImageViewSnapshot = selectedCell?.productImage.snapshotView(afterScreenUpdates: false)
        

        let product = filteredProducts[indexPath.row]
        presentProductDetail(product: product)
    }
    
    func presentProductDetail(product: Product){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productDetailVC = storyboard.instantiateViewController(identifier: "ProductDetailViewController") as! ProductDetailViewController
        
        productDetailVC.transitioningDelegate = self
        productDetailVC.modalPresentationStyle = .fullScreen
        productDetailVC.product = product
        present(productDetailVC, animated: true)
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

//Mark: UICollectionViewDelegateFlowLayout
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

// Mark: UISearchBar Delegate
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

extension CustomCollectionViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let customCollectionVC = presenting as? CustomCollectionViewController,
              let productDetailVC = presented as? ProductDetailViewController,
              let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        else { return nil }
        
        animator = Animator(type: .present, customCollectionViewController: customCollectionVC, productDetailViewController: productDetailVC, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let productDetailVC = dismissed as? ProductDetailViewController,
              let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        else { return nil }
        
        animator = Animator(type: .dismiss, customCollectionViewController: self, productDetailViewController: productDetailVC, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
}
