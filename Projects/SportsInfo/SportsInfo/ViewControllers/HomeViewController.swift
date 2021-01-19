//
//  HomeViewController.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 18.01.2021.
//

import UIKit

class HomeViewController: BaseViewController {
    
//    @IBOutlet private weak var sportCategoriesCollectionView: UICollectionView!{
//        didSet{
//            sportCategoriesCollectionView.delegate = self
//            sportCategoriesCollectionView.dataSource = self
//        }
//    }
    @IBOutlet private weak var matchEventTableView: UITableView! {
        didSet{
            matchEventTableView.delegate = self
            matchEventTableView.dataSource = self
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
        //getAllSports()
        getTurkeyEvents()
    }
    
    private func registerCells(){
        let matchEventCell = UINib(nibName: "MatchEventViewCell", bundle: nil)
        matchEventTableView.register(matchEventCell, forCellReuseIdentifier: "MatchEventViewCell")
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
        return tableView.bounds.height / 4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MatchEventHeaderView()
        headerView.delegate = self
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.bounds.height / 4
    }
}
