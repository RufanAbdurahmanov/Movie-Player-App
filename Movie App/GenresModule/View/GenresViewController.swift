//
//  GenresViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 02.07.22.
//

import UIKit

class GenresViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let cellID = "\(GenreCollectionViewCell.self)"
    var viewModel = DiscoverViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .darkBlueColor
        collectionView.backgroundColor = .clear
        
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        viewModel.getGenres {
            self.collectionView.reloadData()
        }
    }
    
    
}

extension GenresViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! GenreCollectionViewCell
        cell.configure(item: viewModel.genres[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let seeAllMoviesVC = storyboard?.instantiateViewController(withIdentifier: "\(SeeAllMoviesViewController.self)") as! SeeAllMoviesViewController
        viewModel = DiscoverViewModel(id: viewModel.genres[indexPath.item].id ?? 0)
        viewModel.getDiscoverMovies {
            self.viewModel.getGenres {
                seeAllMoviesVC.viewModel = SeeAllMoviesViewModel(movies: self.viewModel.movies)
                self.navigationController?.show(seeAllMoviesVC, sender: nil)
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 10, height: 80)
    }
    
}
