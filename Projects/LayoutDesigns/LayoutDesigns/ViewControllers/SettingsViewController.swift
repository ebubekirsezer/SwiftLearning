//
//  SettingsViewController.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 7.01.2021.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet private weak var settingsTableView: UITableView! {
        didSet{
            settingsTableView.delegate = self
            settingsTableView.dataSource = self
        }
    }
    
    private let settingsSource = DataSource.settings

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsSource.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settingsSource[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsSource[section].settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        
        let setting = settingsSource[indexPath.section].settings[indexPath.row]
        cell.imageView?.image = setting.settingImage
        cell.textLabel?.text = setting.settingTitle
        cell.detailTextLabel?.text = setting.settingSubTitle
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
}

struct SettingsModel {
    let sectiontitle: String
    let settings: [String]
}
