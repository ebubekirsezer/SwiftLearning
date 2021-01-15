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
    @IBOutlet private weak var appActivityIndicator: UIActivityIndicatorView!
    
    var appFeeds = [MediaFeed]() {
        didSet{
            self.topAppsTableView.reloadData()
        }
    }
    var mostLovedApp: Media?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        getNewGamesWeLove(mediaType: Constants.MediaType.apps, feedtype: Constants.FeedType.newGamesWeLove)
        getTopApps(mediaType: Constants.MediaType.apps, feedType: Constants.FeedType.topFree, itemcCount: 7)
    }
    
    //Getting top free application on the Apple Store
    private func getTopApps(mediaType: String ,feedType: String, itemcCount: Int = 3){
        appActivityIndicator.startAnimating()
        appActivityIndicator.hidesWhenStopped = true
        appWebService?.getTopBy(mediaType: mediaType, feedType: feedType, itemCount: itemcCount, completion: { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let mediaFeed):
                self.appFeeds.append(mediaFeed)
                self.appActivityIndicator.stopAnimating()
            }
        })
    }
    
    //Getting new games that loved on Apple Store
    private func getNewGamesWeLove(mediaType: String, feedtype: String, itemCount: Int = 1){
        appWebService?.getTopBy(mediaType: mediaType, feedType: feedtype, itemCount: itemCount, completion: { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let mediaFeed):
                self.mostLovedApp = mediaFeed.results[0]
            }
        })
    }
    
    //Registering Cells
    private func registerCells(){
        let topAppsViewCell = UINib(nibName: "TopAppsViewCell", bundle: nil)
        topAppsTableView.register(topAppsViewCell, forCellReuseIdentifier: "TopAppsViewCell")
    }
}


