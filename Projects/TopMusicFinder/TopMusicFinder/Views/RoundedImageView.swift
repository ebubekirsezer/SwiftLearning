//
//  RoundedImageView.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 12.01.2021.
//

import UIKit

class RoundedImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners([.bottomLeft, .bottomRight], radius: 20)
    }
}

//Rounding Corners
extension UIImageView {
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat){
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}

extension UIImageView {
    func downloadImage(imageUrl: String){
        let songUrl = URL(string: imageUrl)
        
        if let url = songUrl {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let imageData = data {
                    DispatchQueue.main.async {
                        self.image = UIImage(data: imageData)
                    }
                }
            }
            dataTask.resume()
        }
    }
}
