//
//  NewsTableViewController.swift
//  NewsAppMVVM
//
//  Created by Ebubekir Sezer on 29.08.2021.
//

import Foundation
import UIKit
import RxSwift

class NewsTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }
    
    private func populateNews() {
        
        let resource = Resource<ArticleResponse>(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=11c04779461040ada348e604f924f8a4")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { articleResponse in
                
                let articles = articleResponse.articles
                self.articleListViewModel = ArticleListViewModel(articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }).disposed(by: disposeBag)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel == nil ? 0 : (self.articleListViewModel.articlesVM?.count ?? 0)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell is not found")
        }
        
        let articleVM = articleListViewModel.articleAt(indexPath.row)
        
        articleVM?.title.asDriver(onErrorJustReturn: "")
            .drive(cell.titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        articleVM?.description.asDriver(onErrorJustReturn: "")
            .drive(cell.descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        return cell
    }
}
