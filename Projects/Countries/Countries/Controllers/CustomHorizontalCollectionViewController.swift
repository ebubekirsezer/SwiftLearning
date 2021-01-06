//
//  CustomHorizontalCollectionViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 30.12.2020.
//

import UIKit

class CustomHorizontalCollectionViewController: UIViewController {
    
    @IBOutlet private weak var storiesCollectionView: UICollectionView! {
        didSet{
            storiesCollectionView.delegate = self
            storiesCollectionView.dataSource = self
        }
    }

    private let products: [Product] = ProductSource.products
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCellToCollectionView()
    }
    
    private func registerCellToCollectionView(){
        let storyCell = UINib(nibName: "StoryCell", bundle: nil)
        storiesCollectionView.register(storyCell, forCellWithReuseIdentifier: "StoryCell")
    }
}

//MARK: - UICollectionView DataSource and Delegate
extension CustomHorizontalCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
        let product = products[indexPath.row]
        cell.configure(product: product)
        
        return cell
    }
}

//MARK: - UICollectionView Flow Layout
extension CustomHorizontalCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150 , height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
