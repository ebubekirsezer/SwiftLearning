//
//  HomeViewController.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 18.01.2021.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var matchEventTableView: UITableView! {
        didSet{
            matchEventTableView.delegate = self
            matchEventTableView.dataSource = self
        }
    }
    @IBOutlet private weak var sportActivityIndicator: UIActivityIndicatorView!
    
    private var events: [Event] = []{
        didSet{
            matchEventTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        getTurkeyEvents()
    }
    
    private func registerCells(){
        let matchEventCell = UINib(nibName: "MatchEventViewCell", bundle: nil)
        matchEventTableView.register(matchEventCell, forCellReuseIdentifier: "MatchEventViewCell")
    }
    
    private func getTurkeyEvents(){
        sportActivityIndicator.startAnimating()
        webService?.getEventsOnTurkey(query: "eventspastleague.php?id=4339", completion: { (result) in
            switch result {
            case .failure(let error):
                print(error)
                self.sportActivityIndicator.stopAnimating()
            case .success(let matchEvent):
                self.events = matchEvent.events
                self.sportActivityIndicator.stopAnimating()
            }
        })
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchEventViewCell", for: indexPath) as! MatchEventViewCell
        let event = events[indexPath.row]
        cell.configureWith(event: event)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.row]
        let storyboard = UIStoryboard(name: "Event", bundle: nil)
        let eventDetailVC = storyboard.instantiateViewController(identifier: "EventDetailViewController") as! EventDetailViewController
        eventDetailVC.event = event
        show(eventDetailVC, sender: self)
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
