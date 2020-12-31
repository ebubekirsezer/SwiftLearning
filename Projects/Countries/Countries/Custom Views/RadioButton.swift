//
//  RadioButton.swift
//  Countries
//
//  Created by Ebubekir Sezer on 31.12.2020.
//

import UIKit

protocol RadioButtonDelegate{
    func onClick(_ sender: UIView)
}

class RadioButton: UIButton {
    
    var checkedView: UIView?
    var uncheckedView: UIView?
    var delegate: RadioButtonDelegate?
    
    var isChecked: Bool = false {
        didSet{
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        checkedView?.removeFromSuperview()
        uncheckedView?.removeFromSuperview()
        removeConstraints(self.constraints)
        
        let view = isChecked == true ? checkedView : uncheckedView
        
        if let view = view {
            addSubview(view)
            autoresizesSubviews = false
            NSLayoutConstraint.activate([view.centerYAnchor.constraint(equalTo: centerYAnchor)])
        }
    }
    
    @objc func onClick(sender: UIButton){
        if sender == self {
            delegate?.onClick(self)
        }
    }
}
