//
//  CustomizedUIViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 26.12.2020.
//

import UIKit

class CustomizedUIViewController: UIViewController {
    
    @IBOutlet private weak var customUIView: UIView!
    @IBOutlet private weak var customLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeUIView()
        updateLabelAttributes()
    }
    
    @IBAction private func changeTransform(_ sender: UIButton) {
        customUIView.transform = CGAffineTransform(rotationAngle: (CGFloat.pi * 3) / 4)
    }
    
    @objc private func makeTransform(sender: UITapGestureRecognizer){
        if sender.state == .ended {
            self.customUIView.transform = CGAffineTransform(rotationAngle: CGFloat.pi )
        }
    }
    
    private func customizeUIView(){
        let circleUIView = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        
        circleUIView.backgroundColor = UIColor.green
        circleUIView.layer.cornerRadius = circleUIView.bounds.height / 2
        circleUIView.layer.borderWidth = 5
        circleUIView.layer.borderColor = UIColor.orange.cgColor
        
        let rectView = UIView(frame: CGRect(x: 150, y: 50, width: 75, height: 75))
        rectView.backgroundColor = UIColor.yellow
        rectView.layer.borderWidth = 3
        rectView.layer.borderColor = UIColor.black.cgColor
        
        let rectViewTapGesture = UITapGestureRecognizer(target: self, action: #selector (self.makeTransform))
        
        rectView.addGestureRecognizer(rectViewTapGesture)
        
        customUIView.addSubview(circleUIView)
        customUIView.addSubview(rectView)
    }
    
    private func updateLabelAttributes(){
        //Custom Label
        customLabel.numberOfLines = 0
        let quote = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        let font = UIFont.systemFont(ofSize: 18)
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.red
        shadow.shadowBlurRadius = 5
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.firstLineHeadIndent = 15.0
        
        let attributes = [
            NSAttributedString.Key.font: font,
            .foregroundColor: UIColor.blue,
            .shadow: shadow,
            .paragraphStyle: paragraphStyle
        ]
        
        let attributeQuote = NSMutableAttributedString(string: quote, attributes: attributes)
        
        //Single Attribute
//        attributeQuote.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: 5))
        
        //Mutliple Attribute
        let quoteAttributes: [NSAttributedString.Key : Any] = [.backgroundColor: UIColor.green, .kern: 10]
        attributeQuote.addAttributes(quoteAttributes, range: NSRange(location: 0, length: 5))
        
        let firstAttribute: [NSAttributedString.Key: Any] = [
            .backgroundColor: UIColor.green,
            .kern: 10
        ]
        let secondAttribute = [NSAttributedString.Key.foregroundColor: UIColor.red]
        
        let firstString = NSMutableAttributedString(string: "Haters ", attributes: firstAttribute)
        let secondString = NSAttributedString(string: "gonna ", attributes: secondAttribute)
        let thirdString = NSAttributedString(string: "hate")
        
        firstString.append(secondString)
        firstString.append(thirdString)
        
        customLabel.attributedText = attributeQuote
        //customLabel.attributedText = firstString
    }
}
