//
//  OrderlyTableViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 3.01.2021.
//

import UIKit

class OrderlyTableViewController: UIViewController {
    
    @IBOutlet private weak var orderlyTableView: UITableView! {
        didSet{
            orderlyTableView.delegate = self
            orderlyTableView.dataSource = self
        }
    }
    
    private var carsDictionary: [String: [String]] = [:]
    private  var carSectionTitles: [String] = []
    private var cars: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        installCarsInfo()
        installRefreshControl()
    }
    
    private func installCarsInfo(){
        cars = ["Audi", "Aston Martin","BMW", "Bugatti", "Bentley","Chevrolet", "Cadillac","Dodge","Ferrari", "Ford","Honda","Jaguar","Lamborghini","Mercedes", "Mazda","Nissan","Porsche","Rolls Royce","Toyota","Volkswagen"]
        
        for car in cars{
            let carKey = String(car.prefix(1))
            if var carValues = carsDictionary[carKey]{
                carValues.append(car)
                carsDictionary[carKey] = carValues
            } else {
                carsDictionary[carKey] = [car]
            }
        }
        
        carSectionTitles = [String](carsDictionary.keys)
        carSectionTitles = carSectionTitles.sorted(by: { $0 < $1 })
    }
    
    private func installRefreshControl(){
        orderlyTableView.refreshControl = UIRefreshControl()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.orderlyTableView.refreshControl?.endRefreshing()
        }
    }
}

//MARK: - UITableView Delegate and DataSource
extension OrderlyTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let carKey = carSectionTitles[section]
        if let carValues = carsDictionary[carKey] {
            return carValues.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath)
        let carKey = carSectionTitles[indexPath.section]
            if let carValues = carsDictionary[carKey] {
                cell.textLabel?.text = carValues[indexPath.row]
            }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return carSectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return carSectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return carSectionTitles
    }
}
