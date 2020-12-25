//
//  TableViewController.swift
//  DocumentationProject
//
//  Created by Ebubekir Sezer on 23.12.2020.
//

import UIKit

class TableViewController: UITableViewController {
    
    let dataSource: [[String]] = [["İstanbul", "Edirne", "Kocaeli"], ["Ankara", "Konya", "Sivas"], ["Malatya", "Erzurum", "Elazıg","Malatya", "Erzurum", "Elazıg"]]
    //automatic dimension
    // scroll view delegate
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        var cell = UITableViewCell()
        
        if let countryCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell{
            countryCell.configure(with: dataSource.[indexPath.row])
            
            cell = countryCell
        }
        
        return cell
    }
}
