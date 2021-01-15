//
//  CategoryViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 15.01.2021.
//

import UIKit

class CategoryViewController: BaseViewController {
    
    @IBOutlet private weak var categoriesTableView: UITableView!{
        didSet{
            categoriesTableView.delegate = self
            categoriesTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.categories.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")
        let categories = Array(Constants.categories.keys).sorted { $0 < $1 }
        cell?.textLabel?.text = categories[indexPath.row]
        cell?.textLabel?.textColor = UIColor.white
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    
}
