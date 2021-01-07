//
//  CustomizedImageView.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 7.01.2021.
//

import UIKit

@IBDesignable
class CustomizedImageView: UIImageView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.clear {
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
}
