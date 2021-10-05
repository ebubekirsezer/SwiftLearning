//
//  AddTaskViewController.swift
//  GoodList
//
//  Created by Ebubekir Sezer on 19.08.2021.
//

import Foundation
import UIKit
import RxSwift

class AddTaskViewController: UIViewController {
    
    private let taskSubject = PublishSubject<Task>()
    
    var taskSubjectObservable: Observable<Task> {
        return taskSubject.asObservable()
    }
    
    @IBOutlet private weak var prioritySegmentedControl: UISegmentedControl?
    @IBOutlet private weak var taskTitleTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        guard let priority = Priority(rawValue: self.prioritySegmentedControl?.selectedSegmentIndex ?? 0),
              let title = self.taskTitleTextField?.text else {
            return
        }
        
        let task = Task(title: title, priority: priority)
        taskSubject.onNext(task)
        
        self.dismiss(animated: true, completion: nil)
    }
}
