//
//  LeagueViewController.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 19.01.2021.
//

import UIKit

class LeagueViewController: BaseViewController {
    
    @IBOutlet private weak var leagueTableView: UITableView! {
        didSet{
            leagueTableView.delegate = self
            leagueTableView.dataSource = self
        }
    }
    @IBOutlet private weak var leagueActivityIndicator: UIActivityIndicatorView!
    
    var sportCategory: String?
    
    private var leagues: [[String:String?]] = [[:]] {
        didSet{
            leagueTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "League"
        getLeagues()
        registerCell()
    }
    
    private func getLeagues(){
        leagueActivityIndicator.startAnimating()
        if let category = sportCategory {
            webService?.getLeaguesBySportName(query: "search_all_leagues.php?s=\(category)", completion: { (result) in
                switch result{
                case .failure(let error):
                    print(error)
                    self.leagueActivityIndicator.stopAnimating()
                case .success(let leagues):
                    self.leagues = leagues.countrys
                    self.leagueActivityIndicator.stopAnimating()
                }
            })
        }
    }
    
    private func registerCell(){
        let leagueCell = UINib(nibName: "LeagueViewCell", bundle: nil)
        leagueTableView.register(leagueCell, forCellReuseIdentifier: "LeagueViewCell")
    }
}

extension LeagueViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueViewCell", for: indexPath) as! LeagueViewCell
        let league = leagues[indexPath.row]
        cell.configureWith(league: league)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let league = leagues[indexPath.row]
        let storyboard = UIStoryboard(name: "Event", bundle: nil)
        let teamVC = storyboard.instantiateViewController(identifier: "TeamViewController") as! TeamViewController
        
        teamVC.leagueName = league[Constants.EventInfo.eventLeague] ?? ""
        show(teamVC, sender: self)
    }
}
