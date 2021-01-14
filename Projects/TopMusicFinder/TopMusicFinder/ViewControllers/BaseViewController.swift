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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appWebService = appDelegate?.appWebService
    }
}
