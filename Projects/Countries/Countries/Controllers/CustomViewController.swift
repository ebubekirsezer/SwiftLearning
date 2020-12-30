//
//  CustomViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 26.12.2020.
//

import UIKit

class CustomViewController: UIViewController {
    
    @IBOutlet weak var customViewButton: UIButton!
    @IBOutlet weak var bezierPathButton: UIButton!
    @IBOutlet weak var circleViewButton: UIButton!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var downloadedImageButton: UIButton!
    @IBOutlet weak var customStackViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Custom Views"
        self.navigationController?.tabBarItem.title = "View"
        
        customViewButton.layer.cornerRadius = customViewButton.bounds.height / 2
        bezierPathButton.layer.cornerRadius = bezierPathButton.bounds.height / 2
        circleViewButton.layer.cornerRadius = circleViewButton.bounds.height / 2
        imageButton.layer.cornerRadius = imageButton.bounds.height / 2
        downloadedImageButton.layer.cornerRadius = downloadedImageButton.bounds.height / 2
        customStackViewButton.layer.cornerRadius = customStackViewButton.bounds.height / 2
        
        imageButton.setTitle("Send Mail", for: .normal)
        imageButton.setImage(UIImage(systemName: "mail.fill"), for: .normal)
        imageButton.tintColor = UIColor.white
        imageButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: imageButton.bounds.height)
        imageButton.layer.borderWidth = 3
        imageButton.layer.borderColor = UIColor.red.cgColor
        imageButton.setTitle("Mail Sended !!!", for: .highlighted)
        imageButton.setImage(UIImage(systemName: "folder.fill"), for: .highlighted)
        imageButton.setImage(UIImage(systemName: "clear.fill"), for: .disabled)
        imageButton.setTitle("Error Ocurred !!!!", for: .disabled)
    }
    
    @IBAction func goToCustomizeView(_ sender: UIButton) {
        goToAny(viewController: CustomizedUIViewController(), from: "Main")
    }
    
    @IBAction func goToBezierPage(_ sender: UIButton) {
        goToAny(viewController: BezierPathViewController(), from: "Main")
    }
   
    @IBAction func goToCustomCircleView(_ sender: UIButton) {
        imageButton.isEnabled = true
        goToAny(viewController: CustomCircleViewController(), from: "Main")
    }
    
    @IBAction func imageButtonPressed(_ sender: Any) {
        imageButton.isEnabled = false
    }
    
    @IBAction func goToDownloadedImage(_ sender: UIButton) {
        goToAny(viewController: CustomImageViewController(), from: "Main")
    }
    
    @IBAction func goToCustomStackView(_ sender: UIButton) {
        goToAny(viewController: CustomStackViewController(), from: "Main")
    }
    
    @IBAction func goToCustomTextField(_ sender: CustomUIButton) {
        goToAny(viewController: CustomTextFieldViewController(), from: "Main")
    }
}
