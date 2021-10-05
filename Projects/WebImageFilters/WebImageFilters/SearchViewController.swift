//
//  ViewController.swift
//  WebImageFilters
//
//  Created by Karoly Nyisztor on 1/26/21.
//

import UIKit

class PhotoViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PhotoViewCell"
    @IBOutlet var imageView: UIImageView!
}

fileprivate struct PixabayConstants {
    // Number of returned images
    // Accepted values: 3 - 200. See also https://pixabay.com/api/docs/#api_search_images 
    static let fetchLimit = 100
    static let apiKey = "23280697-9bfcc40a2d4e74abb422a57b2"
}

class SearchViewController: UIViewController {
    private var previewImageLinks: [String]?
    private var mediumImageLinks: [String]?
    
    private let filtersViewSegue = "filtersSegue"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == filtersViewSegue {
            guard let viewController = segue.destination as? FiltersViewController else {
                return
            }
            
            if let imageIndex = collectionView.indexPathsForSelectedItems?.first?.row,
               let urlString = mediumImageLinks?[imageIndex],
               let imageURL = URL(string: urlString) {
                viewController.imageURL = imageURL
            }
        }
    }
    
    // A link to Pixabay is required to use their free API
    @IBAction func onLogoTapped(_ sender: UITapGestureRecognizer) {
        guard let url = URL(string: "https://pixabay.com"),
              UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:])
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        previewImageLinks?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoViewCell.reuseIdentifier, for: indexPath) as! PhotoViewCell
        
//        if let urlString = previewImageLinks?[indexPath.row],
//           let imageURL = URL(string: urlString),
//           let imageData = try? Data(contentsOf: imageURL) {
//            let image = UIImage(data: imageData)
//            cell.imageView.image = image
//        }
        
        if let urlString = previewImageLinks?[indexPath.row],
           let imageURL = URL(string: urlString) {
            
//            DispatchQueue.global(qos: .userInitiated).async {
//                guard let imageData = try? Data(contentsOf: imageURL) else {
//                    print("Could not download image data")
//                    return
//                }
//
//                let image = UIImage(data: imageData)
//                DispatchQueue.main.async {
//                    cell.imageView.image = image
//                }
//            }
            
            URLSession.shared.dataTask(with: imageURL) { payload, response, error in
                guard let data = payload, error == nil else {
                    print("Could not download image data")
                    return
                }
                
                guard let httpStatus = response as? HTTPURLResponse,
                      httpStatus.statusCode == 200 else {
                    print("Invalid HTTP status code.")
                    return
                }
                
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.imageView.image = image
                }
            }.resume()
        }
        
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    /*func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTerm = searchText
    }*/
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
        
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {
            return
        }
                
        // Example call https://pixabay.com/api/?key=your_api_key&q=yellow+flowers&image_type=photo
        // Retrieving photos of "yellow flowers". The search term q needs to be URL encoded:
        // See https://pixabay.com/api/docs/#api_search_images
        let urlString = "https://pixabay.com/api/?key=\(PixabayConstants.apiKey)&q=\(searchTerm)&image_type=photo&per_page=\(PixabayConstants.fetchLimit)&safesearch=true"
        guard let url = URL(string: urlString) else {
            return
        }
        
//        guard let data = try? Data(contentsOf: url) else {
//            return
//        }
        
        DispatchQueue.global(qos: .background).async {
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            
            var imageData: PixabayResult?
            
            do {
                let decoder = JSONDecoder()
                imageData = try decoder.decode(PixabayResult.self, from: data)
            } catch let DecodingError.dataCorrupted(context) {
                print(context.debugDescription)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found: \(context.debugDescription)")
                print("codingPath: \(context.codingPath)")
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found: \(context.debugDescription)")
                print("codingPath: \(context.codingPath)")
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch: \(context.debugDescription)")
                print("codingPath: \(context.codingPath)")
            } catch {
                print("error: \(error)")
            }
            
            DispatchQueue.main.async {
                // Show alert
                let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                
                guard imageData?.hits.count != 0 else {
                    let alertController = UIAlertController(title: "No results", message: NSLocalizedString("No images found for \(searchTerm)", comment: ""), preferredStyle: .alert)
                    alertController.addAction(dismissAction)
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
                
                let infoController = UIAlertController(title: "Processing", message: NSLocalizedString("Processing \(imageData?.hits.count ?? 0) results", comment: ""), preferredStyle: .alert)
                infoController.addAction(dismissAction)
                self.present(infoController, animated: true, completion: nil)
                
                self.previewImageLinks = [String]()
                self.mediumImageLinks = [String]()
                
                imageData?.hits.forEach({ (hit) in
                    self.previewImageLinks?.append(hit.previewURL)
                    self.mediumImageLinks?.append(hit.webformatURL)
                })
                
                print(imageData ?? "Oops!")
                
                // update collectionView
                self.collectionView.reloadData()
                // dismiss alert
                infoController.dismiss(animated: true, completion: nil)
            }
        }
    }
}

