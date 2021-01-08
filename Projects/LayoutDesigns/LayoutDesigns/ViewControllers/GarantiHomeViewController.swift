//
//  GarantiHomeViewController.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 8.01.2021.
//

import Foundation
import UIKit

class GarantiHomeViewController: UIViewController {
    
    @IBOutlet private weak var garantiList: UICollectionView!{
        didSet{
            garantiList.delegate = self
            garantiList.dataSource = self
        }
    }
    
    private let bankSource: [BankOperation] = DataSource.bankOperations
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        registerCellViews()
    }
    
    private func registerCellViews(){
        let garantiCardCell = UINib(nibName: "GarantiCardViewCell", bundle: nil)
        garantiList.register(garantiCardCell, forCellWithReuseIdentifier: "GarantiCardViewCell")
    }
    
    private func updateUI(){
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension GarantiHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return bankSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GarantiCardViewCell", for: indexPath) as! GarantiCardViewCell
        
        return cell
    }
}

extension GarantiHomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 8, height: collectionView.bounds.height)
    }
}
