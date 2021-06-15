//
//  SearchViewController.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 26.01.2021.
//

import UIKit

class SearchViewController: BaseViewController {
    
    @IBOutlet weak var searchTableView: UITableView! {
        didSet {
            searchTableView.delegate = self
            searchTableView.dataSource = self
        }
    }
    
    private let myStrings: [String] = [
        "Ebu 1",
        "Ebu 2",
        "Ebu 3",
        "Ebu 4",
        "Ebu 5",
        "Ebu 6",
        "Ebu 7",
        "Ebu 8",
        "Ebu 9",
        "Ebu 10",
        "Ebu 11"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStrings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        
        return cell
    }
    
    
}
