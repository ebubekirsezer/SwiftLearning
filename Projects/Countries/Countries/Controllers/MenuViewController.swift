//
//  MenuViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 5.01.2021.
//

import UIKit

class MenuViewController: UITableViewController {
    
    private var menuItems: [String] = ["Sectionly View", "Search View", "Horizontal View", "Orderly View"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        installTableViewUI()
        regiterCellToTableView()
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("TableView")
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        cell.backgroundColor = UIColor.systemPink
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switchPage(with: menuItems[indexPath.row])
    }
    
    private func installTableViewUI(){
        self.tableView.backgroundColor = UIColor.systemPink
        self.tableView.separatorColor = .clear
    }
    
    private func regiterCellToTableView(){
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
    }
    
    private func switchPage(with name: String){
        switch name {
        case "Sectionly View":
            goToAny(viewController: SectionlyTableViewController(), from: "Main")
        case "Search View":
            goToAny(viewController: CustomTableViewController(), from: "Main")
        case "Horizontal View":
            goToAny(viewController: CustomHorizontalCollectionViewController(), from: "Main")
        case "Orderly View":
            goToAny(viewController: OrderlyTableViewController(), from: "Main")
        default:
            return
        }
    }
}
