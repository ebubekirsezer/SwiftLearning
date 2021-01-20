//
//  FilterViewController.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 20.01.2021.
//

import UIKit

class FilterViewController: BaseViewController {
    
    @IBOutlet private weak var filterTableView: UITableView! {
        didSet{
            filterTableView.delegate = self
            filterTableView.dataSource = self
        }
    }
    var delegate: SearchViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private let filters: [String] = [
        "By Player Name",
        "By Team Name"
    ]
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != filterTableView {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath)
        cell.textLabel?.text = filters[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Fılter Your Search"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = filters[indexPath.row]
        if selectedCategory.lowercased().contains("player") {
            self.dismiss(animated: true) {
                self.delegate?.selectedCategory = .player
            }
        } else {
            self.dismiss(animated: true) {
                self.delegate?.selectedCategory = .team
            }
        }
    }
    
}
