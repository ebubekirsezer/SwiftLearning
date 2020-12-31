//
//  RadioButtonView.swift
//  Countries
//
//  Created by Ebubekir Sezer on 31.12.2020.
//

import UIKit

class RadioButtonView: UIView {
    let radioButton = RadioButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        radioButton.delegate = self
        radioButton.uncheckedView = UIImageView(image: #imageLiteral(resourceName: "radioOff"))
        radioButton.checkedView = UIImageView(image: #imageLiteral(resourceName: "radioOn"))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension RadioButtonView: RadioButtonDelegate {
    
    func onClick(_ sender: UIView) {
        radioButton.isChecked = !radioButton.isChecked
    }
}
