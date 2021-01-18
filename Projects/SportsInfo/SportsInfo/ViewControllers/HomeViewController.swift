//
//  HomeViewController.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 18.01.2021.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var sportCategoriesCollectionView: UICollectionView!{
        didSet{
            sportCategoriesCollectionView.delegate = self
            sportCategoriesCollectionView.dataSource = self
        }
    }
    
    private var sportCategories: [Sport] = []{
        didSet{
            sportCategoriesCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        getAllSports()
    }
    
    private func registerCells(){
        let categoryCell = UINib(nibName: "SportCategoriesViewCell", bundle: nil)
        sportCategoriesCollectionView.register(categoryCell, forCellWithReuseIdentifier: "SportCategoriesViewCell")
    }
    
    private func getAllSports(){
        webService?.getAllSportsBy(query: "all_sports.php", completion: { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let sports):
                self.sportCategories = sports
            }
        })
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportCategoriesViewCell", for: indexPath) as! SportCategoriesViewCell
        let sportCategory = sportCategories[indexPath.row]
        cell.configureWith(sport: sportCategory)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columnSize: CGFloat = 2.5
        return CGSize(width: collectionView.bounds.width / columnSize , height: collectionView.bounds.height)
    }
}
