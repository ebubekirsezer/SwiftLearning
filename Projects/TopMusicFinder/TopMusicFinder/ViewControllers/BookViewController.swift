//
//  BookViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 14.01.2021.
//

import UIKit

class BookViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getBooks()
    }
    
    private func getBooks(){
        appWebService?.getTopBy(mediaType: Constants.MediaType.books, feedType: Constants.FeedType.topFree, itemCount: 10, completion: { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let mediaFeed):
                print(mediaFeed.results)
            }
        })
    }
}
