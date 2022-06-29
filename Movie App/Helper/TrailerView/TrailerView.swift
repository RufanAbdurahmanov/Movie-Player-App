//
//  CustomView.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 14.06.22.
//

import UIKit

class TrailerView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = PlayerViewModel()
    var callBackForVideoID: ((VideoResult)->())?
    let cellID = "\(PlayerCollectionViewCell.self)"
    
    override func layoutSubviews() {
        //
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }
    
    func configure(id: String) {
        viewModel.getMovieVideos(id: id) {
            self.callBackForVideoID?(self.viewModel.videos[0])
            self.collectionView.reloadData()
        }
    }
}
extension TrailerView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PlayerCollectionViewCell
        cell.configure(id: viewModel.videos[indexPath.item].key ?? "")
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        callBackForVideoID?(viewModel.videos[Int(scrollView.contentOffset.x / scrollView.frame.width)])
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
