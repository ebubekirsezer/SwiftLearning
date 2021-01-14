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
    
    private var appFeeds = [MediaFeed]() {
        didSet{
            self.topAppsTableView.reloadData()
        }
    }
    private var mostLovedApp: Media?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        getNewGamesWeLove()
        self.getTopApps(appType: "top-free", itemcCount: 7)
    }
    
    private func getTopApps(appType: String, itemcCount: Int = 3){
        appWebService?.getTopBy(mediaType: Constants.MediaType.apps, feedType: Constants.FeedType.topFree, itemCount: itemcCount, completion: { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let mediaFeed):
                self.appFeeds.append(mediaFeed)
            }
        })
    }
    
    private func getNewGamesWeLove(){
        appWebService?.getTopBy(mediaType: Constants.MediaType.apps, feedType: Constants.FeedType.newGamesWeLove, itemCount: 1, completion: { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let mediaFeed):
                self.mostLovedApp = mediaFeed.results[0]
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        return appFeeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopAppsViewCell", for: indexPath) as! TopAppsViewCell
        
        cell.configureWith(appFeeds: self.appFeeds)
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
        topLovedImageView.downloadImage(imageUrl: mostLovedApp?.artworkUrl100 ?? "https://cdn.ntvspor.net/06c20f774987417c9138e15a01d0080d.jpg?&mode=crop&w=940&h=626.6666666666666")
        
        topLovedImageView.frame = topLovedImageView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0))
        
        return topLovedImageView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.bounds.height / 1.5
    }
    
}
