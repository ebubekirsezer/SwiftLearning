//
//  SplashViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 5.01.2021.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let title = "✨ Countries"
        var characterIndex = 0.0
        for letter in title {
            Timer.scheduledTimer(withTimeInterval: 0.1 * characterIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            characterIndex += 1
        }
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabbarVC = storyboard.instantiateViewController(identifier: "CustomTabbarController") as! CustomTabbarController
            
            tabbarVC.modalTransitionStyle = .crossDissolve
            tabbarVC.modalPresentationStyle = . fullScreen
           // self.dismiss(animated: true, completion: nil)
            self.show(tabbarVC, sender: self)
            //change root view
        }
    }
}
