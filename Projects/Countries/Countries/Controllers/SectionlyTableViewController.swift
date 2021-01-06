//
//  SectionlyTableViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 26.12.2020.
//

import UIKit

class SectionlyTableViewController: UITableViewController {
    
    private let dataSource: [Region] = [
        Region(regionName: "Marmara", cities: CitySource.westCities),
        Region(regionName: "Anadolu", cities: CitySource.anatoliaCities),
        Region(regionName: "Doğu Anadolu", cities: CitySource.eastCities),
    ]
    
    private var filteredData: [Region] = []
    private var sectionTitles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor.clear
        
        registerTableViewCells()
        fillData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let region = dataSource[section]
        return region.cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if let cellItem = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell {
            let region = dataSource[indexPath.section]
            let city = region.cities[indexPath.row]
            cellItem.configure(cityName: city.cityName, image: city.cityImage)
            cell = cellItem
        }

        cell.selectionStyle = .none
        return cell
    }
        
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as! CityCell
        let region = dataSource[section]
        cell.configure(region: region)
        
        return cell.contentView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    
    private func registerTableViewCells() {
        let cityCell = UINib(nibName: "CityCell", bundle: nil)
        self.tableView.register(cityCell, forCellReuseIdentifier: "CityCell")
        let viewCell = UINib(nibName: "ImageTableViewCell", bundle: nil)
        self.tableView.register(viewCell, forCellReuseIdentifier: "ImageTableViewCell")
    }
    
    private func fillData(){
        filteredData = dataSource
        let _ = dataSource.map { sectionTitles.append(String($0.regionName.prefix(1))) }
    }
}
