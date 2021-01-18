//
//  GalleryHeaderView.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 16.01.2021.
//

import UIKit

class GalleryHeaderView: UIView {
    
    @IBOutlet private weak var galleryCollectionView: UICollectionView! {
        didSet{
            galleryCollectionView.delegate = self
            galleryCollectionView.dataSource = self
        }
    }
    var delegate: MusicViewController? {
        didSet{
            getMovies()
            galleryCollectionView.reloadData()
        }
    }
    
    private var gallery: [Media] = []{
        didSet{
            galleryCollectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func getMovies(){
        delegate?.appWebService?.getTopBy(mediaType: Constants.MediaType.movies, feedType: Constants.FeedType.topMovies, itemCount: 6, completion: { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let mediaFeed):
                self.gallery = mediaFeed.results
            }
        })
    }
    
    private func commonInit(){
        let view = Bundle.main.loadNibNamed("GalleryHeaderView", owner: self, options: nil)![0] as! UIView
        view.frame = self.bounds
        addSubview(view)
        registerCell()
    }
    
    private func registerCell(){
        let headerCell = UINib(nibName: "GalleryHeaderViewCell", bundle: nil)
        galleryCollectionView.register(headerCell, forCellWithReuseIdentifier: "GalleryHeaderViewCell")
    }
    
    private func snapToCenter() {
        let centerPoint = self.convert(self.center, to: galleryCollectionView)
        guard let centerIndexPath = galleryCollectionView.indexPathForItem(at: centerPoint) else { return }
        galleryCollectionView.scrollToItem(at: centerIndexPath, at: .centeredHorizontally, animated: true)
    }
    
}

extension GalleryHeaderView: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        snapToCenter()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            snapToCenter()
        }
    }
}

extension GalleryHeaderView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryHeaderViewCell", for: indexPath) as! GalleryHeaderViewCell
        let media = gallery[indexPath.row]
        cell.configureWith(media: media)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let media = gallery[indexPath.row]
        delegate?.goToMediaDetailViewController(media: media)
    }
    
}

extension GalleryHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 48, height: collectionView.bounds.height)
    }
}
