//
//  CollectionViewController.swift
//  DocumentationProject
//
//  Created by Ebubekir Sezer on 23.12.2020.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    let dataSource: [String] = ["Istabul", "Ankara", "Izmir", "Malatya", "Sakarya", "Gaziantep", "Konya", "Istabul", "Ankara", "Izmir", "Malatya", "Sakarya", "Gaziantep", "Konya", "Istabul", "Ankara", "Izmir", "Malatya", "Sakarya", "Gaziantep", "Konya"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    // pagination
    // horizontal collection
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let countryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            countryCell.configure(with: dataSource[indexPath.row])
            
            cell = countryCell
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Country: \(dataSource[indexPath.row])")
    }
}
