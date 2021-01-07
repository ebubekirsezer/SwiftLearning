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
        
        //cell.configure(image: people[indexPath.row].profilePicture)
        
        return cell
    }
    
    
}
