//
//  CategoryViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 15.01.2021.
//

import UIKit
import Firebase

class CategoryViewController: BaseViewController {
    
    @IBOutlet private weak var categoriesTableView: UITableView!{
        didSet{
            categoriesTableView.delegate = self
            categoriesTableView.dataSource = self
        }
    }
    
    private let categories = Array(Constants.categories.keys).sorted { $0 < $1}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            goToLoginPage()
        } catch let logoutError as NSError {
            print("Log out error: \(logoutError.localizedDescription)")
        }
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")
        cell?.textLabel?.text = categories[indexPath.row]
        cell?.textLabel?.textColor = UIColor.white
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = categories[indexPath.row]
        print(selectedCategory)
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let mediaListVC = storyboard.instantiateViewController(identifier: "MediaListViewController") as! MediaListViewController
        mediaListVC.mediaType = Constants.categories[selectedCategory]!
        show(mediaListVC, sender: self)
    }
    
    
}
