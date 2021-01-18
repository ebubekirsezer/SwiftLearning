//
//  BookViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 14.01.2021.
//

import UIKit
import Firebase

class BookViewController: BaseViewController {
    
    @IBOutlet private weak var bookCollectionView: UICollectionView! {
        didSet{
            bookCollectionView.delegate = self
            bookCollectionView.dataSource = self
        }
    }
    @IBOutlet private weak var bookActivityIndicator: UIActivityIndicatorView!
    
    private var books: [Media]? {
        didSet{
            bookCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getBooks()
        registerCells()
    }
    @IBAction private func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            goToLoginPage()
        } catch let logoutError as NSError {
            print("Log out error: \(logoutError.localizedDescription)")
        }
    }
    
    private func registerCells(){
        let bookCell = UINib(nibName: "BookViewCell", bundle: nil)
        bookCollectionView.register(bookCell, forCellWithReuseIdentifier: "BookViewCell")
    }
    
    private func getBooks(){
        bookActivityIndicator.startAnimating()
        bookActivityIndicator.hidesWhenStopped = true
        appWebService?.getTopBy(mediaType: Constants.MediaType.books, feedType: Constants.FeedType.topFree, itemCount: 10, completion: { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let mediaFeed):
                self.books = mediaFeed.results
                self.bookActivityIndicator.stopAnimating()
            }
        })
    }
}

extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookViewCell", for: indexPath) as! BookViewCell
        if let book = books?[indexPath.row]{
            cell.configureWith(book: book)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedBook = books?[indexPath.row] {
            let myImage = #imageLiteral(resourceName: "MABV")
            cache.setObject(myImage, forKey: "CachedMediaImage")
            //print(cache.object(forKey: "CachedMediaImage"))
            goToMediaDetailViewController(media: selectedBook)
        }
    }
}

extension BookViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columnSize: CGFloat = 2
        let spacing = self.collectionView(collectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAt: indexPath.row)
        return CGSize(width: (collectionView.bounds.width / columnSize) - spacing, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

