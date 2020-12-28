//
//  CustomCircleViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 27.12.2020.
//

import UIKit

class CustomCircleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let circleView = CircleView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        circleView.backgroundColor = UIColor.white
        
        view.addSubview(circleView)
    }
}
