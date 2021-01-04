//
//  HomeViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 26.12.2020.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var buttonTableViewWithSection: UIButton!
    @IBOutlet weak var buttonTableViewWithSearch: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "List Types"
        self.navigationController?.tabBarItem.title = "Lists"
        
        buttonTableViewWithSection.layer.cornerRadius = buttonTableViewWithSection.bounds.height / 2
        buttonTableViewWithSearch.layer.cornerRadius = buttonTableViewWithSearch.bounds.height / 2
        
    }
    @IBAction func goToTableViewWithSection(_ sender: UIButton) {
        goToAny(viewController: SectionlyTableViewController(), from: "Main")
    }
    
    @IBAction func goToTableViewWithSearch(_ sender: UIButton) {
        goToAny(viewController: CustomTableViewController(), from: "Main")
    }
    
    @IBAction func goToHorizontalCollectionView(_ sender: CustomUIButton) {
        goToAny(viewController: CustomHorizontalCollectionViewController(), from: "Main")
    }
    
    @IBAction func goToOrderlyTableView(_ sender: CustomUIButton) {
        goToAny(viewController: OrderlyTableViewController(), from: "Main")
    }
}

extension UIViewController {
    
    func goToAny<T: UIViewController>(viewController: T, from storyboardName: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(identifier: String(describing: T.self)) as? T else { return }
        
        show(nextViewController, sender: self)
    }

}
