//
//  SectionlyTableViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 26.12.2020.
//

import UIKit

class SectionlyTableViewController: UITableViewController {
    
    let dataSource: [Region] = [
        Region(regionName: "Marmara", cities: CitySource.westCities),
        Region(regionName: "Anadolu", cities: CitySource.anatoliaCities),
        Region(regionName: "Doğu Anadolu", cities: CitySource.eastCities),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor.clear
        self.registerTableViewCells()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return (dataSource.count * 2)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section % 2 == 0 {
            return 1
        } else {
            let index = section / 2
            return dataSource[index].cities.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section % 2 == 0 {
            let index = indexPath.section / 2
            cell.textLabel?.text = dataSource[index].regionName
            cell.textLabel?.font = UIFont(name: "TimesNewRomanPSMT", size: 36.0)
        } else {
            if let cellItem = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell {
                //print(indexPath)
                let index = (indexPath.section - 1) / 2
                //print(index)
                let data = dataSource[index].cities[indexPath.row]
                cellItem.configure(cityName: data.cityName, image: data.cityImage)
                cell = cellItem
            }
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section % 2 == 0 {
            if section == 0 {
                return .nan
            }
            return 48
        }
        return .nan
        
    }
    
    private func registerTableViewCells() {
        let viewCell = UINib(nibName: "ImageTableViewCell", bundle: nil)
        self.tableView.register(viewCell, forCellReuseIdentifier: "ImageTableViewCell")
    }
}
