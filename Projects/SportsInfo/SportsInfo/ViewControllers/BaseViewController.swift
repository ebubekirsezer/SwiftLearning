//
//  BaseViewController.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 18.01.2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    var webService: SportWebService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        webService = appDelegate?.webService    }
    
    private func getService(){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        webService = appDelegate?.webService
    }
}

extension BaseViewController{
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard(){
        view.endEditing(true)
    }
}
