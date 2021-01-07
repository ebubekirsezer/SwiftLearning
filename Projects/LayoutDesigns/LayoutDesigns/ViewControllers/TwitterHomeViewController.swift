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
    
    private let people = DataSource.people
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    private func registerCells(){
        let storyCell = UINib(nibName: "StoryViewCell", bundle: nil)
        storyList.register(storyCell, forCellWithReuseIdentifier: "StoryViewCell")
    }
}

extension TwitterHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryViewCell", for: indexPath) as! StoryViewCell
        
        let person = people[indexPath.row]
        cell.configureWith(person: person)
        return cell
    }
    
}

extension TwitterHomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
