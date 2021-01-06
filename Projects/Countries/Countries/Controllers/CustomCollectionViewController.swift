//
//  CustomCollectionViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 29.12.2020.
//

import UIKit

class CustomCollectionViewController: UIViewController {
    
    @IBOutlet private weak var filterView: UIView!
    @IBOutlet private weak var buttonOrderList: UIButton!
    @IBOutlet private weak var buttonFilterList: UIButton!
    @IBOutlet private weak var productListView: UICollectionView! {
        didSet{
            productListView.delegate = self
            productListView.dataSource = self
        }
    }
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var searchBar: UISearchBar! {
        didSet{
            searchBar.delegate = self
        }
    }
    @IBOutlet private weak var constraintHeightForHeaderView: NSLayoutConstraint!
    
    private var products: [Product] = ProductSource.products
    private var filteredProducts: [Product] = []
    private var showingTopViews = false
    private var selectedCellImageViewSnapshot: UIView?
    private var animator: Animator?

    var selectedCell: ProductCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredProducts = products
        installNotificationCenter()
        registerCellToCollectionView()
        updateUI()
    }
    
    @IBAction private func orderListPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let orderListVC = storyboard.instantiateViewController(identifier: "OrderListViewController") as! OrderListViewController
        
        orderListVC.modalPresentationStyle = .overFullScreen
        orderListVC.modalTransitionStyle = .crossDissolve
        self.present(orderListVC, animated: false, completion: nil)
    }
    
    @objc private func updateProductList(){
        products = ProductSource.products
        filteredProducts = products
        productListView.reloadData()
    }
    
    private func updateUI(){
        //Hiding Navigation Bar
        //self.navigationController?.hidesBarsOnSwipe = true
        
        filterView.layer.cornerRadius = filterView.bounds.height / 4
        
        buttonOrderList.setImage(UIImage(systemName: "infinity"), for: .normal)
        buttonOrderList.tintColor = UIColor.black
        buttonOrderList.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: buttonOrderList.bounds.height)
        
        buttonFilterList.setImage(UIImage(systemName: "shuffle"), for: .normal)
        buttonFilterList.tintColor = UIColor.black
        buttonFilterList.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: buttonFilterList.bounds.height)
    }
    
    private func registerCellToCollectionView(){
        let productCell = UINib(nibName: "ProductCell", bundle: nil)
        productListView.register(productCell, forCellWithReuseIdentifier: "ProductCell")
    }
    
    private func presentProductDetailVC(with product: Product){
        let productDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
                
        productDetailVC.transitioningDelegate = self
        productDetailVC.modalPresentationStyle = .fullScreen
        productDetailVC.product = product
        present(productDetailVC, animated: true)
    }
    
    private func installNotificationCenter(){
        let notificationCenter: NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(updateProductList), name: .updateProductList, object: nil)
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
            
        presentProductDetailVC(with: filteredProducts[indexPath.row])
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print(scrollView.contentSize.height) 1800
        let offsetY = scrollView.contentOffset.y
        if offsetY > 150 {
            //Change priority
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
        let columnSize: CGFloat = 2
        let spacing = self.collectionView(collectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAt: indexPath.row)
        return CGSize(width: (collectionView.bounds.size.width / columnSize) - spacing, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
    }
}

//MARK: - UISearchBar Delegate
extension CustomCollectionViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredProducts = []
        
        if searchText.isEmpty {
            filteredProducts = products
        } else {
            filteredProducts = products.filter { $0.productName.lowercased().contains(searchText.lowercased()) }
        }
        self.productListView.reloadData()
    }
}

//MARK: - UIViewControllerTransitioning Delegate
extension CustomCollectionViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let customCollectionViewController = presenting as? CustomCollectionViewController,
              let productDetailViewController = presented as? ProductDetailViewController,
              let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
              else { return nil }

        //global animator will remove
        animator = Animator(type: .present, customCollectionViewController: customCollectionViewController, productDetailViewController: productDetailViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let productDetailViewController = dismissed as? ProductDetailViewController,
            let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
            else { return nil }
        
        animator = Animator(type: .dismiss, customCollectionViewController: self, productDetailViewController: productDetailViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
}

extension Notification.Name {
    static let updateProductList = Notification.Name(rawValue: "UpdateProductListNotification")
}

