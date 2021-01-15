//
//  RoundedImageView.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 12.01.2021.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
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
        let mediaUrl = URL(string: imageUrl)
        
        if let url = mediaUrl {
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
    
    
    func returnDownloadedImage(imageUrl: String) -> UIImage {
        let mediaUrl = URL(string: imageUrl)
        var mediaImage = UIImage()
        
        if let url = mediaUrl {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let imageData = data {
                    DispatchQueue.main.async {
                        if let downloadedImage = UIImage(data: imageData){ mediaImage = downloadedImage }
                    }
                }
            }
            dataTask.resume()
        }
        
        return mediaImage
    }
}

