//
//  SplashViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 17.01.2021.
//

import UIKit
import Firebase

class SplashViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigateToNewRootView()
    }
    
    
    private func navigateToNewRootView(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let _ = Auth.auth().currentUser {
                self.goToHomePage()
            } else {
                self.goToLoginPage()
            }
        }
    }
}
