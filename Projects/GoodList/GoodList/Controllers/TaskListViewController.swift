//
//  TaskListViewController.swift
//  GoodList
//
//  Created by Ebubekir Sezer on 19.08.2021.
//

import Foundation
import UIKit
import RxSwift
import RxRelay

class TaskListViewController: UIViewController {
    
    @IBOutlet private weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet private weak var tableView: UITableView?
    
    private var tasks = BehaviorRelay<[Task]>(value: [])
    private var filteredTasks = [Task]()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navC = segue.destination as? UINavigationController,
              let addTVC = navC.viewControllers.first as? AddTaskViewController else {
            fatalError("Controller not found")
        }
        
        addTVC.taskSubjectObservable.subscribe { [unowned self] task in
            
            var existingTasks = self.tasks.value
            existingTasks.append(task)
            self.tasks.accept(existingTasks)
            
        } onError: {  error in
            
        } onCompleted: {
            
        } onDisposed: {
            
        }.disposed(by: disposeBag)

    }
    
    @IBAction func priorityValueChanged(_ sender: UISegmentedControl) {
        let priority = Priority(rawValue: sender.selectedSegmentIndex - 1)
        filterTasks(by: priority)
    }
    
    private func updateTableView() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    private func filterTasks(by priority: Priority?) {
        if let selectedPriority = priority {
            self.tasks.map { tasks in
                return tasks.filter { $0.priority == selectedPriority }
            }.subscribe(onNext: { [weak self] tasks in
                self?.filteredTasks = tasks
                self?.updateTableView()
            }).disposed(by: disposeBag)

        } else {
            self.filteredTasks = self.tasks.value
            self.updateTableView()
        }
    }
}

extension TaskListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath)
        
        let task = filteredTasks[indexPath.row]
        
        cell.textLabel?.text = task.title
        
        return cell
    }
}
