//
//  CircleView.swift
//  Countries
//
//  Created by Ebubekir Sezer on 27.12.2020.
//

import UIKit

class CircleView: UIView {

    override func draw(_ rect: CGRect) {
        
        let circleHeight = rect.width
        
        let circle = UIBezierPath(ovalIn: CGRect(x: 0, y: 150, width: rect.width, height: circleHeight))
        UIColor.purple.setFill()
        circle.fill()
    }

}
