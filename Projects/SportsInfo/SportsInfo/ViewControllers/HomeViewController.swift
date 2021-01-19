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
    @IBOutlet private weak var matchEventTableView: UITableView! {
        didSet{
            matchEventTableView.delegate = self
            matchEventTableView.dataSource = self
        }
    }
    
    private var sportCategories: [Sport] = []{
        didSet{
            sportCategoriesCollectionView.reloadData()
        }
    }
    private var matchEvents: [[String:String?]] = [[:]] {
        didSet{
            matchEventTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        getAllSports()
        getTurkeyEvents()
    }
    
    private func registerCells(){
        let categoryCell = UINib(nibName: "SportCategoriesViewCell", bundle: nil)
        sportCategoriesCollectionView.register(categoryCell, forCellWithReuseIdentifier: "SportCategoriesViewCell")
        let matchEventCell = UINib(nibName: "MatchEventViewCell", bundle: nil)
        matchEventTableView.register(matchEventCell, forCellReuseIdentifier: "MatchEventViewCell")
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
    
    private func getTurkeyEvents(){
        webService?.getEventsOnTurkey(query: "eventspastleague.php?id=4339", completion: { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let matchEvent):
                self.matchEvents = matchEvent.events
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchEventViewCell", for: indexPath) as! MatchEventViewCell
        let event = matchEvents[indexPath.row]
        cell.configureWith(event: event)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Turkey Super League Latest Matches"
    }
    
}
