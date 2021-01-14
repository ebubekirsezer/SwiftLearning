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
    private var appFeeds = [MediaFeed]() {
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
    
    func configureWith(appFeeds: [MediaFeed]){
        self.appFeeds = appFeeds
    }
}

extension TopAppsViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return appFeeds.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appFeeds[section].results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppTableViewCell", for: indexPath) as! AppTableViewCell
        
        print(appFeeds.count)
        let app = appFeeds[indexPath.section].results[indexPath.row]
        cell.configureWith(media: app)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 48))
        headerView.backgroundColor = UIColor.clear
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: headerView.bounds.width, height: headerView.bounds.height))
        titleLabel.text = appFeeds[section].title
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        
        headerView.addSubview(titleLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 7.5
    }
}
