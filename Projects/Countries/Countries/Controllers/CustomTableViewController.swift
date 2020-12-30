//
//  CustomTableViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 28.12.2020.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var data = [
        "Apples",
        "Oranges",
        "Pears",
        "Bananas",
        "Plums",
        "Grapes",
        "Watermelon",
        "Lemon",
        "Mandarin",
        "Mango",
        "Pineapple",
        "Apples",
        "Oranges",
        "Pears",
        "Bananas",
        "Plums",
        "Grapes",
        "Watermelon",
        "Lemon",
        "Mandarin",
        "Mango",
        "Pineapple"]
    
    var filteredData: [String] = []
    
    var fetchingMore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        let loadingNib = UINib(nibName: "LoadingCell", bundle: nil)
        tableView.register(loadingNib, forCellReuseIdentifier: "loadingCell")
        
        filteredData = data
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //use willdisplay
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return filteredData.count
        } else if section == 1 && fetchingMore {
            return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            if let countryCell = tableView.dequeueReusableCell(withIdentifier: "Cell"){
                countryCell.textLabel?.text = filteredData[indexPath.row]
                cell = countryCell
            }
        } else {
            if let indicatorCell = tableView.dequeueReusableCell(withIdentifier: "loadingCell") as? LoadingCell {
                indicatorCell.activityIndicator.startAnimating()
                cell = indicatorCell
            }
        }
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height {
            if !fetchingMore {
                beginBatchFetch()
            }
        }
    }
    
    
    
    func beginBatchFetch(){
        fetchingMore = true
        print("begin fetch")
        tableView.reloadSections(IndexSet(integer: 1), with: .none)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let newItems = ["Ebubekir 1", "Ebubekir 2", "Ebubekir 3", "Ebubekir 4", "Ebubekir 5"]
            self.filteredData.append(contentsOf: newItems)
            self.fetchingMore = false
            self.tableView.reloadData()
        }
    }
}
extension CustomTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        if searchText == "" {
            filteredData = data
        } else {
            for fruit in data {
                
                if fruit.lowercased().contains(searchText.lowercased()){
                    filteredData.append(fruit)
                }
            }
        }
        
        self.tableView.reloadData()
    }
}
