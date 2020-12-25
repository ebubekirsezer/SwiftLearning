//
//  SettingsViewController.swift
//  TabbarSample
//
//  Created by Ebubekir Sezer on 24.12.2020.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var alertButton: UIButton!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var alertTextFieldButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertButton.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        alertButton.setTitle("Create Alert", for: .normal)
        alertButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        alertButton.titleLabel?.font = UIFont(name: "System", size: 18.0)
        alertButton.layer.cornerRadius = alertButton.bounds.height / 2
        
        actionButton.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        actionButton.setTitle("Create Action", for: .normal)
        actionButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        actionButton.titleLabel?.font = UIFont(name: "System", size: 18.0)
        actionButton.layer.cornerRadius = actionButton.bounds.height / 2
        
        alertTextFieldButton.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        alertTextFieldButton.setTitle("Create Alert with TextField", for: .normal)
        alertTextFieldButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        alertTextFieldButton.titleLabel?.font = UIFont(name: "System", size: 18.0)
        alertTextFieldButton.layer.cornerRadius = alertTextFieldButton.bounds.height / 2
        
        segmentedControl.selectedSegmentTintColor = UIColor.purple
        segmentedControl.tintColor = UIColor.red
        segmentedControl.backgroundColor = UIColor.white
//        segmentedControl.setDividerImage(#imageLiteral(resourceName: "istanbul"), forLeftSegmentState: UIControl.State.normal, rightSegmentState: UIControl.State.normal, barMetrics: UIBarMetrics.default)
        
        //left selected
        
//        segmentedControl.setDividerImage(UIImage(systemName: "volume.fill"), forLeftSegmentState: UIControl.State.selected, rightSegmentState: UIControl.State.normal, barMetrics: UIBarMetrics.default)
        
        
        
        segmentedControl.setDividerImage(UIImage(systemName: "volume.fill"), forLeftSegmentState: UIControl.State.normal, rightSegmentState: UIControl.State.selected, barMetrics: UIBarMetrics.default)
    }
    
    @IBAction func createAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Did you read documentation?", message: "You need to read documentation to learn", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            print("YES")
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action) in
            print("NO")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func createAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Did you read documentation?", message: "You need to read documentation to learn", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            print("YES")
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action) in
            print("NO")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func createAlertWithTextField(_ sender: UIButton) {
        let alert = UIAlertController(title: "Enter your name?", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: nil))
        
        alert.addTextField { (textField) in
            textField.placeholder = "Input your name"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            if let name = alert.textFields?.first?.text {
                print("Name: \(name)")
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
