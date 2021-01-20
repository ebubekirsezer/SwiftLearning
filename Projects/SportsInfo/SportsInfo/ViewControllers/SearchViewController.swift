//
//  SearchViewController.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 20.01.2021.
//

import UIKit

class SearchViewController: BaseViewController {
    
    @IBOutlet private weak var searchTableView: UITableView! {
        didSet{
            searchTableView.delegate = self
            searchTableView.dataSource = self
        }
    }
    @IBOutlet private weak var searchBar: UISearchBar! {
        didSet{
            searchBar.delegate = self
        }
    }
    @IBOutlet private weak var emptyTitle: UILabel!
    var selectedCategory: FilterType?
    private var searchResults: [[String:String?]] = [[:]]{
        didSet{
            searchTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction private func filterPressed(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Event", bundle: nil)
        let filterVC = storyboard.instantiateViewController(identifier: "FilterViewController") as! FilterViewController
        filterVC.delegate = self
        filterVC.modalPresentationStyle = .overFullScreen
        filterVC.modalTransitionStyle = .crossDissolve
        self.present(filterVC, animated: false, completion: nil)
    }
    
    private func updateUI(){
        initializeHideKeyboard()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchString = searchText.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        emptyTitle.isHidden = true
        switch selectedCategory {
        case .player:
            webService?.searchPlayerBy(query: "searchplayers.php?p=\(searchString)", completion: { (result) in
                switch result{
                case .failure(let error):
                    print(error)
                case .success(let players):
                    self.searchResults = players.player
                }
            })
        case .team:
            webService?.searchTeamBy(query: "searchteams.php?t=\(searchString)", completion: { (result) in
                switch result{
                case .failure(let error):
                    print(error)
                case .success(let teams):
                    self.searchResults = teams.teams
                }
            })
        default:
            webService?.searchPlayerBy(query: "searchplayers.php?p=\(searchString)", completion: { (result) in
                switch result{
                case .failure(let error):
                    print(error)
                case .success(let players):
                    self.searchResults = players.player
                }
            })
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)
        
        let result = searchResults[indexPath.row]
        
        switch selectedCategory {
        case .player:
            cell.textLabel?.text = result["strPlayer"] ?? ""
        case .team:
            cell.textLabel?.text = result[Constants.EventInfo.teamName] ?? ""
        default:
            cell.textLabel?.text = result["strPlayer"] ?? ""
        }
        cell.textLabel?.textColor = UIColor.white
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
