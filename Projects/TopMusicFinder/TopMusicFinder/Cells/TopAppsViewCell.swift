//
//  TopAppsViewCell.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 14.01.2021.
//

import UIKit

class TopAppsViewCell: UITableViewCell {
    
    @IBOutlet weak var appTableView: UITableView! {
        didSet{
            appTableView.delegate = self
            appTableView.dataSource = self
        }
    }
    private var appFeeds = [AppFeed]() {
        didSet{
            appTableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerCells()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func registerCells(){
        let appCell = UINib(nibName: "AppTableViewCell", bundle: nil)
        appTableView.register(appCell, forCellReuseIdentifier: "AppTableViewCell")
    }
    
    func configureWith(appFeeds: [AppFeed]){
        self.appFeeds = appFeeds
    }
}

extension TopAppsViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return appFeeds.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appFeeds[section].results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppTableViewCell", for: indexPath) as! AppTableViewCell
        
        let app = appFeeds[indexPath.section].results?[indexPath.row]
        
        if let app = app {
            cell.configureWith(app: app)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Uygulamalar"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 4.25
    }
    
    
}
