//
//  BaseViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 13.01.2021.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    var appWebService: AppWebService?
    //Look again
    static let cache = NSCache<NSString, UIImage>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appWebService = AppWebService.service
    }
}

extension BaseViewController {
    
    func goToMediaDetailViewController(media: Media, from storyboardName: String = "Detail"){
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let mediaDetailViewController = storyboard.instantiateViewController(identifier: "MediaDetailViewController") as! MediaDetailViewController
        
        mediaDetailViewController.media = media
        show(mediaDetailViewController, sender: self)
    }
    
    func goToHomePage(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeTabbarViewController") as! UITabBarController
        UIApplication.shared.windows.first?.rootViewController = homeVC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func goToLoginPage(){
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        UIApplication.shared.windows.first?.rootViewController = loginVC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension BaseViewController {
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard(){
        view.endEditing(true)
    }
}

extension BaseViewController {
    func saveToCache(image: UIImage){
        BaseViewController.cache.setObject(image, forKey: "CachedMediaImage")
    }
}
