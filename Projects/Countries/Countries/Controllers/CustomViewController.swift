//
//  CustomViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 26.12.2020.
//

import UIKit

class CustomViewController: UIViewController {
    
    @IBOutlet weak var imageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageButtonUIUpdate()
    }
    
    @IBAction private func goToCustomizeView(_ sender: UIButton) {
        goToAny(viewController: CustomizedUIViewController(), from: "Main")
    }
    
    @IBAction private func goToBezierPage(_ sender: UIButton) {
        goToAny(viewController: BezierPathViewController(), from: "Main")
    }
   
    @IBAction private func goToCustomCircleView(_ sender: UIButton) {
        imageButton.isEnabled = true
        goToAny(viewController: CustomCircleViewController(), from: "Main")
    }
    
    @IBAction private func imageButtonPressed(_ sender: Any) {
        imageButton.isEnabled = false
    }
    
    @IBAction private func goToDownloadedImage(_ sender: UIButton) {
        goToAny(viewController: CustomImageViewController(), from: "Main")
    }
    
    @IBAction private func goToCustomStackView(_ sender: UIButton) {
        goToAny(viewController: CustomStackViewController(), from: "Main")
    }
    
    @IBAction private func goToCustomTextField(_ sender: CustomUIButton) {
        goToAny(viewController: CustomTextFieldViewController(), from: "Main")
    }
    
    private func imageButtonUIUpdate(){
        imageButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: imageButton.bounds.height)
        imageButton.setTitle("Mail Sended !!!", for: .highlighted)
        imageButton.setImage(UIImage(systemName: "folder.fill"), for: .highlighted)
        imageButton.setImage(UIImage(systemName: "clear.fill"), for: .disabled)
        imageButton.setTitle("Error Ocurred !!!!", for: .disabled)
    }
}
