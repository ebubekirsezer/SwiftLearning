//
//  ViewController.swift
//  UIHostingControllerDemo
//
//  Created by Ebubekir Sezer on 19.09.2021.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    fileprivate let contentViewInHC = UIHostingController(rootView: CView())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupHC()
        setupConstraints()
        //contentViewInHC.view.frame = .init(x: 100, y:100, width: 100, height: 100)
    }
    
    fileprivate func setupConstraints() {
        contentViewInHC.view.translatesAutoresizingMaskIntoConstraints = false
        contentViewInHC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentViewInHC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentViewInHC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentViewInHC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    fileprivate func setupHC() {
        addChild(contentViewInHC)
        view.addSubview(contentViewInHC.view)
        contentViewInHC.didMove(toParent: self)
    }


}

