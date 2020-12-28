//
//  ProfileViewController.swift
//  TabbarSample
//
//  Created by Ebubekir Sezer on 24.12.2020.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "istanbul"))
        view.addSubview(imageView)
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = imageView.bounds
        view.addSubview(blurredEffectView)
        
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyEffectView.frame = imageView.bounds
        
        //view.addSubview(vibrancyEffectView)
        
        
        //uiview backgroun corner, subview, cirle view, transform, bazier path, draw image with code
        /*
         gesture
         lazy loadinh,
         stack fill equaşly with different content size
         stack view iboutlet and hide with click
         button image and title spacing
         button border, change color with disable and selected
         label chnage line size, wrapping, attributedString
         imageview get image from net and play with content size fill
         textfield when text change update the list
         textfield control the inputs, keyboard, keyboard cycle,keyboard toolbar
         Mapkit draw root to specific location
         Mapkit draw overlay, draw circle
         */
    }
}
