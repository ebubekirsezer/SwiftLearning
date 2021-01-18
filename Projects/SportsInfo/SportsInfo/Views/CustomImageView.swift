//
//  CustomImageView.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 18.01.2021.
//

import UIKit

class CustomImageView: UIImageView {
    
}

extension CustomImageView {
    func downloadImage(imageUrl: String){
        if let url = URL(string: imageUrl) {
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
