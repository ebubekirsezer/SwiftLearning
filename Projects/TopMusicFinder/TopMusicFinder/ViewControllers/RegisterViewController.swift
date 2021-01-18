//
//  RegisterViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 16.01.2021.
//

import UIKit
import Firebase

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var registerScrollView: UIScrollView!
    @IBOutlet private weak var emailTextField: UITextField! {
        didSet{
            emailTextField.delegate = self
        }
    }
    @IBOutlet private  weak var passwordTextField: UITextField! {
        didSet{
            passwordTextField.delegate = self
        }
    }
    @IBOutlet private weak var registerActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI(){
        subscribeToNotification(UIResponder.keyboardWillShowNotification, selector: #selector(keyboardWillShowOrHide))
        subscribeToNotification(UIResponder.keyboardWillHideNotification, selector: #selector(keyboardWillShowOrHide))
        initializeHideKeyboard()
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

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = self.view.viewWithTag(textField.tag + 1){
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}

extension RegisterViewController {
    func subscribeToNotification(_ notification: NSNotification.Name, selector: Selector){
        NotificationCenter.default.addObserver(self, selector: selector, name: notification, object: nil)
    }
    
    func unsubscribeFromAllNotifications(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShowOrHide(notification: NSNotification){
        if let scrollView = registerScrollView,
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
