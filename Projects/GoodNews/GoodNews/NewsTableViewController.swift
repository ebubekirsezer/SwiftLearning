//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by Ebubekir Sezer on 27.08.2021.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    private let disposeBag = DisposeBag()
    
    private var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }
    
    private func populateNews() {
        
        URLRequest.load(resource: ArticleList.all)
            .subscribe(onNext: { [weak self] result in
                
                if let result = result {
                    self?.articles = result.articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell does not exist")
        }
        
        if let article = articles?[indexPath.row] {
            cell.setupCell(with: article)
        }
        
        return cell
    }
}
