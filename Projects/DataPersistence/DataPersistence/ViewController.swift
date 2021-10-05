//
//  ViewController.swift
//  DataPersistence
//
//  Created by Ebubekir Sezer on 1.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var departmentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // When the value changed on the system this observer will solve the problem
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onUbiquitousKeyValueStoreDidChangeExternally),
                                               name: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
                                               object: NSUbiquitousKeyValueStore.default)
        NSUbiquitousKeyValueStore.default.synchronize()
        
        refreshUI()
    }
    
    @objc private func onUbiquitousKeyValueStoreDidChangeExternally(notification: Notification) {
        let changeReason = notification.userInfo![NSUbiquitousKeyValueStoreChangeReasonKey] as! Int
        let changedKeys = notification.userInfo![NSUbiquitousKeyValueStoreChangedKeysKey] as! [String]
        
        switch changeReason {
        case NSUbiquitousKeyValueStoreInitialSyncChange, NSUbiquitousKeyValueStoreServerChange, NSUbiquitousKeyValueStoreAccountChange:
            refreshUI()
        default:
            
        }
    }
    
    //MARK: -  UI
    private func refreshUI() {
        
        nameTextField.text = NSUbiquitousKeyValueStore.default.string(forKey: "name")
        emailTextField.text = NSUbiquitousKeyValueStore.default.string(forKey: "email")
        departmentTextField.text = NSUbiquitousKeyValueStore.default.string(forKey: "department")
        
        
        //This is for the User Defaults
//        nameTextField.text = UserDefaults.standard.string(forKey: "name")
//        emailTextField.text = UserDefaults.standard.string(forKey: "email")
//        departmentTextField.text = UserDefaults.standard.string(forKey: "department")
    }

    //MARK: - Actions
    @IBAction func savePressed(_ sender: UIButton) {
        
        NSUbiquitousKeyValueStore.default.setValue(nameTextField.text, forKey: "name")
        NSUbiquitousKeyValueStore.default.setValue(emailTextField.text, forKey: "email")
        NSUbiquitousKeyValueStore.default.setValue(departmentTextField.text, forKey: "department")
        
        NSUbiquitousKeyValueStore.default.synchronize()

        
        //This is for the User Defaults
//        UserDefaults.standard.setValue(nameTextField.text, forKey: "name")
//        UserDefaults.standard.setValue(emailTextField.text, forKey: "email")
//        UserDefaults.standard.setValue(departmentTextField.text, forKey: "department")
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        
        NSUbiquitousKeyValueStore.default.removeObject(forKey: "name")
        
        //This is for the User Defaults
        //UserDefaults.standard.removeObject(forKey: "name")
    }
}

