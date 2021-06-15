//
//  TeamViewController.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 19.01.2021.
//

import UIKit

class TeamViewController: BaseViewController {
    
    @IBOutlet private weak var teamTableView: UITableView! {
        didSet{
            teamTableView.delegate = self
            teamTableView.dataSource = self
        }
    }
    @IBOutlet private weak var teamActivityIndicator: UIActivityIndicatorView!
    
    var leagueName: String?
    private var teams: [Team] = [] {
        didSet{
            teamTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        getTeam()
    }
    
    private func registerCell(){
        let teamCell = UINib(nibName: "TeamViewCell", bundle: nil)
        teamTableView.register(teamCell, forCellReuseIdentifier: "TeamViewCell")
    }
    
    private func getTeam(){
        teamActivityIndicator.startAnimating()
        if let name = leagueName{
            let newName = name.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
            webService?.getTeamsInLeague(query: "search_all_teams.php?l=\(newName)", completion: { (result) in
                switch result{
                case .failure(let error):
                    print(error)
                    self.teamActivityIndicator.stopAnimating()
                case .success(let teams):
                    self.teams = teams.teams
                    self.teamActivityIndicator.stopAnimating()
                }
            })
        }
    }
}

extension TeamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamViewCell", for: indexPath) as! TeamViewCell
        
        let selectedTeam = teams[indexPath.row]
        cell.configureWith(team: selectedTeam)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTeam = teams[indexPath.row]
        let storyboard = UIStoryboard(name: "Event", bundle: nil)
        let teamDetailVC = storyboard.instantiateViewController(identifier: "TeamDetailViewController") as! TeamDetailViewController
        teamDetailVC.team = selectedTeam
        show(teamDetailVC, sender: self)
    }
}
