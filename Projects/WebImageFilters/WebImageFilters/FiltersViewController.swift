//
//  FiltersViewController.swift
//  WebImageFilters
//
//  Created by Karoly Nyisztor on 1/26/21.
//

import UIKit

struct Filter {
    static let names = ["CIPhotoEffectChrome",
    "CIPhotoEffectFade",
    "CIPhotoEffectInstant",
    "CIPhotoEffectMono",
    "CIPhotoEffectNoir",
    "CIPhotoEffectProcess",
    "CISepiaTone",
    "CIPhotoEffectTonal",
    "CIPhotoEffectTransfer",
    "CILinearToSRGBToneCurve"]

    static func applyFilter(image: UIImage,
                            filter name: String,
                            group: DispatchGroup,
                            completionHandler: @escaping(UIImage) -> ()) {
        
        group.enter()
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            defer { group.leave() }
            
            guard let ciImage = CIImage(image: image) else {
                completionHandler(image)
                return
            }
            
            let filter = CIFilter(name: name, parameters: [kCIInputImageKey: ciImage])
            
            guard let output = filter?.outputImage else {
                completionHandler(image)
                return
            }
            let filteredImage = UIImage(ciImage: output)
            completionHandler(filteredImage)
            return
        }
    }
}

class FiltersCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "FilterViewCell"
    @IBOutlet weak var imageView: UIImageView!
}

class FiltersViewController: UIViewController {

    @IBOutlet weak var selectedImageView: UIImageView!
    //var image: UIImage?
    var imageURL: URL?
    var filteredImages: [UIImage]?
        
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        guard let selectedImage = image else {
//            return
//        }
//
//        selectedImageView.image = selectedImage
        
        guard let url = imageURL else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] payload, response, error in
            guard let data = payload, error == nil else {
                print("Could not download image data")
                return
            }
            
            guard let httpStatus = response as? HTTPURLResponse,
                  httpStatus.statusCode == 200 else {
                print("Invalid HTTP status code")
                return 
            }
            
            guard let image = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                
                self?.selectedImageView.image = image
                
                self?.filteredImages = [UIImage]()
                
                let group = DispatchGroup()
                
                Filter.names.forEach { name in
                    Filter.applyFilter(image: image, filter: name, group: group) { filteredImage in
                        self?.filteredImages?.append(filteredImage)
                    }
                }
                
                group.notify(queue: .main) {
                    self?.collectionView.reloadData()
                }
            }
        }.resume()
    }
    
    @IBAction func onClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension FiltersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let image = filteredImages?[indexPath.row] {
            selectedImageView.image = image
        }        
    }
}

extension FiltersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredImages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltersCollectionViewCell.reuseIdentifier, for: indexPath) as! FiltersCollectionViewCell
        
        if let filteredImage = filteredImages?[indexPath.row] {
            cell.imageView.image = filteredImage
        }
        
        return cell
    }
}
