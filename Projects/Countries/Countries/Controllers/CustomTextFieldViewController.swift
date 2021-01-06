//
//  CustomTextFieldViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 30.12.2020.
//

import UIKit

class CustomTextFieldViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField! {
        didSet{
            textField.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardUIUpdates()
    }
    
    @objc private func resetTheTextField(){
        textField.text = ""
    }
    
    private func keyboardUIUpdates(){
        let bar = UIToolbar()
        let reset = UIBarButtonItem(title: "Temizle", style: .plain, target: self, action: #selector(resetTheTextField))
        bar.items = [reset]
        bar.sizeToFit()
        textField.inputAccessoryView = bar
        textField.keyboardType = .alphabet
        textField.keyboardAppearance = .light
        textField.clearButtonMode = .whileEditing
    }
}

//MARK: - UITextField Delegate
extension CustomTextFieldViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let _ = string.rangeOfCharacter(from: NSCharacterSet.letters){
            return true
        } else {
            return false
        }
    }
}
