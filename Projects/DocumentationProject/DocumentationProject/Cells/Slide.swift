//
//  Slide.swift
//  DocumentationProject
//
//  Created by Ebubekir Sezer on 24.12.2020.
//

import UIKit

class Slide: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    func createSlides() -> [Slide] {
        let slide1: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = #imageLiteral(resourceName: "istanbul")
        
        let slide2: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = #imageLiteral(resourceName: "istanbul")
        
        let slide3: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = #imageLiteral(resourceName: "istanbul")
        
        return [slide1, slide2, slide3]
    }
}
