//
//  RadioButtonView.swift
//  Countries
//
//  Created by Ebubekir Sezer on 4.01.2021.
//

import UIKit

class RadioButtonView: UIView {
    
    let radioButton = CustomUIButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        self.addSubview(radioButton)
        radioButton.translatesAutoresizingMaskIntoConstraints = false
        radioButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        radioButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        radioButton.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        radioButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        radioButton.tag = tag
        radioButton.addTarget(self, action: #selector(onRadioButtonTap), for: .touchUpInside)
        
        radioButton.setImage(radioButton.isSelected ? #imageLiteral(resourceName: "radioOn") : #imageLiteral(resourceName: "radioOff"), for: .normal)
    }
    
    @objc func onRadioButtonTap(_ sender: CustomUIButton) {
        sender.isSelected = !sender.isSelected
        sender.setImage(sender.isSelected ? #imageLiteral(resourceName: "radioOn") : #imageLiteral(resourceName: "radioOff"), for: .normal)
    }
}
