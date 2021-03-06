//
//  CustomImageViewController.swift
//  Countries
//
//  Created by Ebubekir Sezer on 28.12.2020.
//

import UIKit

class CustomImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    private let imageUrl: URL? = URL(string: "https://istanbul.ktb.gov.tr/Resim/251740,istjpg.png?0")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeImageView()
        downloadImageFromNetSecondWay()
    }
    
    @objc private func rotateImage(){
        UIView.animate(withDuration: 2.0) {
            self.imageView.transform = CGAffineTransform(rotationAngle:  (.pi) / 2)
        }
    }
    
    private func customizeImageView(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.rotateImage))
        
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
    }
    
    //2nd way
    // This way does not block the main thread
    private func downloadImageFromNetSecondWay(){
        if let url = self.imageUrl {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let imageData = data {
                    DispatchQueue.main.async {
                        self.imageView.contentMode = .scaleAspectFit
                        self.imageView.image = UIImage(data: imageData)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    // 1st way
    // This method run on the main thread and wait until the image downloaded
    private func downloadImageFromNetFirstWay(){
        DispatchQueue.global().async {
            if let url = self.imageUrl, let data  = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
}
