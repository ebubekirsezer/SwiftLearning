//
//  HolidaysTableViewController.swift
//  Holidays
//
//  Created by Ebubekir Sezer on 12.01.2021.
//

import Foundation
import UIKit

class HolidaysTableViewController: UITableViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    var listOfHolidays = [HolidayDetail]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listOfHolidays.count) Holidays"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfHolidays.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        let holiday = listOfHolidays[indexPath.row]
        cell.textLabel?.text = holiday.name
        cell.detailTextLabel?.text = holiday.date.iso
        return cell
    }
}

extension HolidaysTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else { return }
        let holidayRequest = HolidayRequest(countryCode: searchBarText)
        holidayRequest.getHolidays { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let holidayDetails):
                self?.listOfHolidays = holidayDetails
            }
        }
        
    }
}
