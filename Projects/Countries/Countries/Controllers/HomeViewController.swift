//
//  HomeViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 26.12.2020.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {
        
    private var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTabAndNavigationBar()
        setupMenu()
    }
    
    @IBAction private func goToTableViewWithSection(_ sender: UIButton) {
        goToAny(viewController: SectionlyTableViewController(), from: "Main")
    }
    
    @IBAction private func goToTableViewWithSearch(_ sender: UIButton) {
        goToAny(viewController: CustomTableViewController(), from: "Main")
    }
    
    @IBAction private func goToHorizontalCollectionView(_ sender: CustomUIButton) {
        goToAny(viewController: CustomHorizontalCollectionViewController(), from: "Main")
    }
    
    @IBAction private func goToOrderlyTableView(_ sender: CustomUIButton) {
        goToAny(viewController: OrderlyTableViewController(), from: "Main")
    }
    
    @IBAction private func menuTapped(_ sender: UIBarButtonItem) {
        present(menu!, animated: true, completion: nil)
    }
    
    private func updateTabAndNavigationBar(){
        self.tabBarController?.tabBar.tintColor = UIColor.systemPink
        self.title = "List Types"
        self.navigationController?.tabBarItem.title = "Lists"
    }
    
    private func setupMenu(){
        menu = SideMenuNavigationController(rootViewController: MenuViewController())
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
}

extension UIViewController {
    func goToAny<T: UIViewController>(viewController: T, from storyboardName: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(identifier: String(describing: T.self)) as? T else { return }
        
        show(nextViewController, sender: self)
    }
}
