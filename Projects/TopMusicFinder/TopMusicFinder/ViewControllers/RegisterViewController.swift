//
//  RegisterViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 16.01.2021.
//

import UIKit
import Firebase

class RegisterViewController: BaseViewController {
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private  weak var passwordTextField: UITextField!
    @IBOutlet private weak var registerActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func registerPressed(_ sender: RoundedButton) {
        registerActivityIndicator.startAnimating()
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let e = error {
                    print(e.localizedDescription)
                    self.registerActivityIndicator.stopAnimating()
                } else {
                    self.goToHomePage()
                    self.registerActivityIndicator.stopAnimating()
                }
            }
        }
    }
}
