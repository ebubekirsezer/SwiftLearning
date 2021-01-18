//
//  LoginViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 16.01.2021.
//

import UIKit
import Firebase

class LoginViewController: BaseViewController {
    
    @IBOutlet private weak var loginScrollView: UIScrollView!
    @IBOutlet private weak var emailTextField: UITextField! {
        didSet{
            emailTextField.delegate = self
        }
    }
    @IBOutlet private weak var passwordTextField: UITextField! {
        didSet{
            passwordTextField.delegate = self
        }
    }
    @IBOutlet private weak var registerLabel: UILabel!
    @IBOutlet private weak var loginActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromAllNotifications()
    }
    
    @IBAction private func loginPressed(_ sender: RoundedButton) {
        loginActivityIndicator.startAnimating()
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let e = error {
                    print(e.localizedDescription)
                    self.loginActivityIndicator.stopAnimating()
                } else {
                    self.goToHomePage()
                    self.loginActivityIndicator.stopAnimating()
                }
            }
        }
    }
    
    private func updateUI(){
        subscribeToNotification(UIResponder.keyboardWillShowNotification, selector: #selector(keyboardWillShowOrHide))
        subscribeToNotification(UIResponder.keyboardWillHideNotification, selector: #selector(keyboardWillShowOrHide))
        initializeHideKeyboard()
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

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = self.view.viewWithTag(textField.tag + 1){
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}

extension LoginViewController {
    func subscribeToNotification(_ notification: NSNotification.Name, selector: Selector){
        NotificationCenter.default.addObserver(self, selector: selector, name: notification, object: nil)
    }
    
    func unsubscribeFromAllNotifications(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShowOrHide(notification: NSNotification){
        if let scrollView = loginScrollView,
           let userInfo = notification.userInfo,
           let endValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey],
           let durationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey],
           let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] {
            
            let endRect = view.convert((endValue as AnyObject).cgRectValue, from: view.window)
            let keyboardOverlap = scrollView.frame.maxY - endRect.origin.y
            
            scrollView.contentInset.bottom = keyboardOverlap
            scrollView.verticalScrollIndicatorInsets.bottom = keyboardOverlap
            
            let duration = (durationValue as AnyObject).doubleValue
            let options = UIView.AnimationOptions(rawValue: UInt((curveValue as AnyObject).integerValue << 16))
            UIView.animate(withDuration: duration!, delay: 0, options: options, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
}
