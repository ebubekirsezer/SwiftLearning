//
//  TwitterHomeViewController.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 6.01.2021.
//

import UIKit

class TwitterHomeViewController: UIViewController {
    
    
    @IBOutlet private weak var storyList: UICollectionView! {
        didSet{
            storyList.delegate = self
            storyList.dataSource = self
        }
    }
    @IBOutlet weak var postList: UICollectionView! {
        didSet{
            postList.delegate = self
            postList.dataSource = self
        }
    }
    
    private let people = DataSource.people
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    private func registerCells(){
        let postCell = UINib(nibName: "PostViewCell", bundle: nil)
        postList.register(postCell, forCellWithReuseIdentifier: "PostViewCell")
        
        let storyCell = UINib(nibName: "StoryViewCell", bundle: nil)
        storyList.register(storyCell, forCellWithReuseIdentifier: "StoryViewCell")
    }
}

extension TwitterHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard collectionView == postList else {
            return people.count
        }
        return people[section].posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard collectionView == postList else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryViewCell", for: indexPath) as! StoryViewCell
            
            let person = people[indexPath.row]
            cell.configureWith(person: person)
            return cell
        }
        let postCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostViewCell", for: indexPath) as! PostViewCell
        return postCell
    }
    
}

extension TwitterHomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard collectionView == postList else {
            return CGSize(width: 90, height: 90)
        }
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
