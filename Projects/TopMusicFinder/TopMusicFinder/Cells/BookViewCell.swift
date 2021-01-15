//
//  BookViewCell.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 14.01.2021.
//

import UIKit

class BookViewCell: UICollectionViewCell {

    @IBOutlet private weak var bookImage: UIImageView!
    @IBOutlet private weak var bookName: UILabel!
    @IBOutlet private weak var bookAuthorName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureWith(book: Media){
        bookImage.downloadImage(imageUrl: book.artworkUrl100 ?? Constants.defaultImage)
        bookName.text = book.name
        bookAuthorName.text = book.artistName
    }

}
