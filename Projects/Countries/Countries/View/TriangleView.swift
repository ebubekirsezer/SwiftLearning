//
//  TriangleView.swift
//  Countries
//
//  Created by Ebubekir Sezer on 27.12.2020.
//

import UIKit

class TriangleView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        //Triangle
        let triangle = UIBezierPath()
        triangle.move(to: CGPoint(x: 200, y: 300))
        triangle.addLine(to: CGPoint(x: 250, y: 380))
        triangle.addLine(to: CGPoint(x: 150, y: 380))
        triangle.close()
        
        UIColor.orange.setFill()
        triangle.fill()
        
        UIColor.red.setStroke()
        triangle.stroke()
        
        
        //Rectangle
        let rectangle = UIBezierPath(rect: CGRect(x: 80, y: 100, width: 100, height: 80))
        UIColor.green.setFill()
        rectangle.fill()
        
        //Circle
        let circle = UIBezierPath(ovalIn: CGRect(x: 230, y: 100, width: 80, height: 80))
        UIColor.yellow.setFill()
        circle.fill()
        
        //Rounded Rectangle
        let roundedRectangle = UIBezierPath(roundedRect: CGRect(x: 80, y: 200, width: 100, height: 80), cornerRadius: 7.0)
        UIColor.purple.setFill()
        roundedRectangle.fill()
        
        // Very rounded Rectangle
//        let veryRoundedRectangle = UIBezierPath(roundedRect: CGRect(x: 220, y: 200, width: 100, height: 80), cornerRadius: 25.0)
//        UIColor.red.setFill()
//        veryRoundedRectangle.fill()
        
        //Arc
        let fillArc = UIBezierPath(arcCenter: CGPoint(x: 150, y: 400), radius: 100.0, startAngle: 1.0, endAngle: 3.0, clockwise: true)
        UIColor.blue.setFill()
        fillArc.fill()
        
        // Stroke Arc
        let strokeArc = UIBezierPath(arcCenter: CGPoint(x: 300, y: 400), radius: 100.0, startAngle: 1.0, endAngle: 3.0, clockwise: true)
        UIColor.blue.setStroke()
        strokeArc.stroke()
        
        //Curve
        let fillCurve = UIBezierPath()
        fillCurve.move(to: CGPoint(x: 50, y: 525))
        fillCurve.addCurve(to: CGPoint(x: 200, y: 575), controlPoint1: CGPoint(x: 125, y: 605), controlPoint2: CGPoint(x: 150, y: 445))
        UIColor.orange.setFill()
        fillCurve.fill()
        
        // Stroke Curve
        let strokeCurve = UIBezierPath()
        strokeCurve.move(to: CGPoint(x: 200, y: 525))
        strokeCurve.addCurve(to: CGPoint(x: 350, y: 575), controlPoint1: CGPoint(x: 275, y: 605), controlPoint2: CGPoint(x: 300, y: 445))
        UIColor.orange.setStroke()
        strokeCurve.stroke()
        
        
        let oneSideRoundedRect = UIBezierPath(roundedRect: CGRect(x: 220, y: 200, width: 100, height: 80), byRoundingCorners: [UIRectCorner.bottomRight, UIRectCorner.bottomLeft], cornerRadii: CGSize(width: 15, height: 15))
        UIColor.red.setFill()
        oneSideRoundedRect.fill()
    }

}
