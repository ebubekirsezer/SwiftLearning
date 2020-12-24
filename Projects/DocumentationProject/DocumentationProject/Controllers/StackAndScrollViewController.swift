//
//  StackAndScrollViewController.swift
//  DocumentationProject
//
//  Created by Ebubekir Sezer on 24.12.2020.
//

import UIKit

class StackAndScrollViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var pageControlButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customImageView.image = #imageLiteral(resourceName: "istanbul")
        
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        pageControlButton.setTitle("Go To Page Control", for: .normal)
        pageControlButton.backgroundColor = #colorLiteral(red: 0.09808254987, green: 0.26281178, blue: 0.2842366695, alpha: 1)
        pageControlButton.layer.cornerRadius = pageControlButton.bounds.height / 2
        pageControlButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        customImageView.addGestureRecognizer(tapGR)
        customImageView.isUserInteractionEnabled = true
        
        let firstView = stackView.arrangedSubviews[0]
        firstView.isHidden = false
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer){
        if sender.state == .ended {
            UIView.animate(withDuration: 0.25) {
                let firsView = self.stackView.arrangedSubviews[0]
                firsView.isHidden = true
            }
        }
    }
    
    @IBAction func goToPageControl(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pageControlVC = storyboard.instantiateViewController(identifier: "PageControlViewController") as! PageControlViewController
        
        pageControlVC.modalPresentationStyle = .fullScreen
        pageControlVC.modalTransitionStyle = .flipHorizontal
        
        show(pageControlVC, sender: self)
    }
    
}
