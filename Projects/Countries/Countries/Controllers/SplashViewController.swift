//
//  SplashViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 5.01.2021.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTitle()
        navigateToNewRootView()
        
    }
    
    private func updateTitle(){
        let title = "✨ Countries"
        var characterIndex = 0.0
        for letter in title {
            Timer.scheduledTimer(withTimeInterval: 0.1 * characterIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            characterIndex += 1
        }
    }
    
    private func navigateToNewRootView(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabbarVC = storyboard.instantiateViewController(identifier: "CustomTabbarController") as! CustomTabbarController
            UIApplication.shared.windows.first?.rootViewController = tabbarVC
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
}
