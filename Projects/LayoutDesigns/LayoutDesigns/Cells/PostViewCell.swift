//
//  PostViewCell.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 7.01.2021.
//

import UIKit

class PostViewCell: UICollectionViewCell {

    @IBOutlet private weak var postProfilePicture: CustomizedImageView!
    @IBOutlet private weak var postNameAndSurname: UILabel!
    @IBOutlet private weak var postUserName: UILabel!
    @IBOutlet private weak var postDetail: UILabel!
    @IBOutlet private weak var postPicture: CustomizedImageView!
    @IBOutlet private weak var commentsButton: UIButton!
    @IBOutlet private weak var retweetButton: UIButton!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var postPictureHeightForImage: NSLayoutConstraint!
    @IBOutlet private weak var postPictureHeightWithoutImage: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWith(post: Post){
        
        if let _ = post.postPicture {
            postPictureHeightForImage.priority = UILayoutPriority(rawValue: 750)
            postPictureHeightWithoutImage.priority = UILayoutPriority(rawValue: 1000)
        }
        postPictureHeightForImage.priority = UILayoutPriority(rawValue: 1000)
        postPictureHeightWithoutImage.priority = UILayoutPriority(rawValue: 750)
        postProfilePicture.image = post.person.profilePicture
        postNameAndSurname.text = post.person.name + " " + post.person.surname
        postUserName.text = post.person.username
        postDetail.text = post.postDetail
        postPicture.image = post.postPicture
        commentsButton.setTitle(String(post.comments), for: .normal)
        retweetButton.setTitle(String(post.shared), for: .normal)
        likeButton.setTitle(String(post.postLike), for: .normal)
    }

}
