//
//  CustomUIButton.swift
//  Countries
//
//  Created by Ebubekir Sezer on 30.12.2020.
//

import UIKit

@IBDesignable
class CustomUIButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderwidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderwidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
}
