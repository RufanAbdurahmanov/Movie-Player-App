//
//  ComingSoonViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 06.06.22.
//

import UIKit

class ComingSoonViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = ComingSoonViewModel()
    let cellID = "\(ComingSoonCollectionViewCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Coming Soon"
        //view.setTwoGradient(colorOne: UIColor.lightBlueColor, colorTwo: UIColor.darkBlueColor)
        view.backgroundColor = UIColor.darkBlueColor

        viewModel.getComingSoonMovies {
            self.collectionView.reloadData()
        }
        
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        
    }

}
extension ComingSoonViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ComingSoonCollectionViewCell
        cell.configure(item: viewModel.itemAtCell(index: indexPath.row))
        cell.layer.cornerRadius = 5
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        let detailsID = "\(MovieDetailsViewController.self)"
//        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: detailsID) as! MovieDetailsViewController
//    
//        detailsVC.viewModel = MovieDetailsViewModel(id: viewModel.upcomingMovies[indexPath.item].cellId ?? 0, name: viewModel.upcomingMovies[indexPath.item].cellTitle ?? "")
//        self.navigationController?.show(detailsVC, sender: nil)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 110 )
    }
    
}
