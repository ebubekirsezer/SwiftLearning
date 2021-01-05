//
//  HomeViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 26.12.2020.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {
    
    @IBOutlet weak var buttonTableViewWithSection: UIButton!
    @IBOutlet weak var buttonTableViewWithSearch: UIButton!
    
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.tintColor = UIColor.systemPink
        
        
        self.title = "List Types"
        self.navigationController?.tabBarItem.title = "Lists"
        
        menu = SideMenuNavigationController(rootViewController: MenuViewController())
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
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
    
    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        present(menu!, animated: true, completion: nil)
    }
}

extension UIViewController {
    
    func goToAny<T: UIViewController>(viewController: T, from storyboardName: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(identifier: String(describing: T.self)) as? T else { return }
        
        show(nextViewController, sender: self)
    }

}


class MenuVC : UITableViewController{
    var menuItems: [String] = ["Sectionly View", "Search View", "Horizontal View", "Orderly View"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        cell.textLabel?.text = menuItems[indexPath.row]
        return cell
    }
}
