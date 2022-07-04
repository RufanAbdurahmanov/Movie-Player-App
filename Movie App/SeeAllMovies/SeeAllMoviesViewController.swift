//
//  SeeAllMoviesViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 30.06.22.
//

import UIKit

class SeeAllMoviesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellID = "\(CollectionViewCell.self)"
    var viewModel = SeeAllMoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkBlueColor
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }
}

extension SeeAllMoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .lightBlueColor.withAlphaComponent(0.3)
        cell.configure(data: viewModel.movies[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailsID = "\(MovieDetailsViewController.self)"
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: detailsID) as! MovieDetailsViewController
    
        detailsVC.viewModel = MovieDetailsViewModel(id: viewModel.movies[indexPath.item].cellId ?? 0, name: viewModel.movies[indexPath.item].cellTitle ?? "")
        self.navigationController?.show(detailsVC, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: 240)
    }
}
