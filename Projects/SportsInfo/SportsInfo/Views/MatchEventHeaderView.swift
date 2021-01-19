//
//  MatchEventHeaderView.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 19.01.2021.
//

import UIKit

class MatchEventHeaderView: UIView {

    @IBOutlet private weak var sportCategoriesCollectionView: UICollectionView! {
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
    
    var delegate: HomeViewController? {
        didSet{
            getAllSports()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func registerCell(){
        let categoryCell = UINib(nibName: "SportCategoriesViewCell", bundle: nil)
        sportCategoriesCollectionView.register(categoryCell, forCellWithReuseIdentifier: "SportCategoriesViewCell")
    }
    
    private func getAllSports(){
        delegate?.webService?.getAllSportsBy(query: "all_sports.php", completion: { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let sports):
                self.sportCategories = sports
            }
        })
    }
    
    private func commonInit(){
        let view = Bundle.main.loadNibNamed("MatchEventHeaderView", owner: self, options: nil)![0] as! UIView
        view.frame = self.bounds
        addSubview(view)
        registerCell()
    }
}

extension MatchEventHeaderView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportCategories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportCategoriesViewCell", for: indexPath) as! SportCategoriesViewCell
        let sportCategory = sportCategories[indexPath.row]
        cell.configureWith(sport: sportCategory)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategory = sportCategories[indexPath.row]
        let storyboard = UIStoryboard(name: "Event", bundle: nil)
        let leagueVC = storyboard.instantiateViewController(identifier: "LeagueViewController") as! LeagueViewController
        leagueVC.sportCategory = selectedCategory.strSport
        delegate?.show(leagueVC, sender: self)
    }
}

extension MatchEventHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columnSize: CGFloat = 2.5
        return CGSize(width: collectionView.bounds.width / columnSize , height: collectionView.bounds.height)
    }
}
