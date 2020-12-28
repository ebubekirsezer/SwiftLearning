//
//  BezierPathViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 27.12.2020.
//

import UIKit

class BezierPathViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Bezier Path"
        
        let triangleView = TriangleView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        triangleView.backgroundColor = .white
        self.view.addSubview(triangleView)
        
        

    }
}
