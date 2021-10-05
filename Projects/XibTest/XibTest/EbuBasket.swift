//
//  EbuBasket.swift
//  XibTest
//
//  Created by Ebubekir Sezer on 7.03.2021.
//

import UIKit

class EbuBasket: UIView {
    
    var basketButton: UIButton?
    var basketImage: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = .yellow
        
        createButton()
        
    }
    
    private func createButton() {
        basketButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))

        basketButton?.setTitle("Sepeti Görüntüle", for: .normal)
        basketButton?.backgroundColor = .red
        basketButton?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        if let button = basketButton {
            self.addSubview(button)
        }

        basketButton?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        basketButton?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        basketButton?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        basketButton?.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        basketButton?.centerYAnchor.constraint(equalTo: basketImage?.centerYAnchor ?? self.centerYAnchor).isActive = true
    }
    
    private func createBasketImageView() {
        basketImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 18, height: 24))
    }
}
