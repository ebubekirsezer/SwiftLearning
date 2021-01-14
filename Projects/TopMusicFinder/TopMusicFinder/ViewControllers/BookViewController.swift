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
        appWebService?.getTopBooks(bookType: "top-free", itemCount: 10, completion: { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let bookFeed):
                print(bookFeed.results)
            }
        })
    }
}
