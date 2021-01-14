//
//  AppsViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 13.01.2021.
//

import Foundation
import UIKit

class AppsViewController: BaseViewController {
    
    @IBOutlet private weak var topAppsTableView: UITableView! {
        didSet{
            topAppsTableView.delegate = self
            topAppsTableView.dataSource = self
        }
    }
    
    private var appFeeds = [AppFeed]() {
        didSet{
            self.topAppsTableView.reloadData()
        }
    }
    private var mostLovedApp: App?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        getTopGrossing()
        getTopApps()
    }
    
    private func getTopApps(){
        appWebService?.getTopApps(appType: "top-free", itemCount: 4) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let appFeed):
                self.appFeeds.append(appFeed)
            }
        }
    }
    
    private func getTopGrossing(){
        appWebService?.getTopApps(appType: "new-games-we-love", itemCount: 1, completion: { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let appFeed):
                self.mostLovedApp = appFeed.results?[0]
            }
        })
    }
    
    private func registerCells(){
        let topAppsViewCell = UINib(nibName: "TopAppsViewCell", bundle: nil)
        topAppsTableView.register(topAppsViewCell, forCellReuseIdentifier: "TopAppsViewCell")
    }
}

extension AppsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return appFeeds.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appFeeds[section].results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopAppsViewCell", for: indexPath) as! TopAppsViewCell
        
        cell.configureWith(appFeeds: self.appFeeds)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 1.5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let topLovedImageView = RoundedImageView()
        topLovedImageView.cornerRadius = 30
        topLovedImageView.bounds.size = CGSize(width: tableView.bounds.width, height: tableView.bounds.height / 2)
        topLovedImageView.backgroundColor = UIColor.gray
        topLovedImageView.downloadImage(imageUrl: mostLovedApp?.artworkUrl100 ?? "https://cdn.ntvspor.net/06c20f774987417c9138e15a01d0080d.jpg?&mode=crop&w=940&h=626.6666666666666")
        
        topLovedImageView.frame = topLovedImageView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0))
        
        return topLovedImageView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.bounds.height / 1.5
    }
    
}
