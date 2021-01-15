//
//  AppsViewController+TableView.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 14.01.2021.
//

import UIKit

extension AppsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.appFeeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopAppsViewCell", for: indexPath) as! TopAppsViewCell
        cell.configureWith(appFeeds: self.appFeeds)
        cell.appViewControllerDelegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let topLovedImageView = RoundedImageView()
        topLovedImageView.cornerRadius = 30
        topLovedImageView.bounds.size = CGSize(width: tableView.bounds.width, height: tableView.bounds.height / 2)
        topLovedImageView.backgroundColor = UIColor.gray
        topLovedImageView.downloadImage(imageUrl: self.mostLovedApp?.artworkUrl100 ?? Constants.defaultImage)
        
        topLovedImageView.frame = topLovedImageView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0))
        
        return topLovedImageView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.bounds.height / 1.5
    }
}
