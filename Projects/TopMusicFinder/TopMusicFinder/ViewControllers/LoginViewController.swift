//
//  LoginViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 16.01.2021.
//

import UIKit
import Firebase

class LoginViewController: BaseViewController {
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var registerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction private func loginPressed(_ sender: RoundedButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.goToHomePage()
                }
            }
        }
    }
    
    private func updateUI(){
        print("update")
        let registerTapGesture = UITapGestureRecognizer(target: self, action: #selector(registerTapped))
        registerLabel.addGestureRecognizer(registerTapGesture)
    }
    
    @objc private func registerTapped(){
        print("tapped")
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let registerVC = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        show(registerVC, sender: self)
    }
}
