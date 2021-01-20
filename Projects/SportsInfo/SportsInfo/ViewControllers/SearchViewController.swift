//
//  SearchViewController.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 20.01.2021.
//

import UIKit

class SearchViewController: BaseViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var emptyTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func filterPressed(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Event", bundle: nil)
        let filterVC = storyboard.instantiateViewController(identifier: "FilterViewController") as! FilterViewController
        
        filterVC.modalPresentationStyle = .overFullScreen
        filterVC.modalTransitionStyle = .crossDissolve
        self.present(filterVC, animated: false, completion: nil)
    }
}
