//
//  HomeViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 30.05.22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectonView: UICollectionView!
    let cellID = "\(HomeCollectionViewCell.self)"
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Movie App"
        view.setTwoGradient(colorOne: UIColor.lightBlueColor, colorTwo: UIColor.darkBlueColor)
        
        collectonView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        getDatas2()
        
    }
    
    func getDatas2() {
        viewModel.getMovies {
            self.viewModel.getTVs {
                self.viewModel.getNowPlayingMovies {
                    self.viewModel.getPopularMovies {
                        self.viewModel.getTopRatedMovies {
                            self.viewModel.getDiscoverMovies {
                                self.collectonView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HomeCollectionViewCell
        cell.configureCell(viewModel: CellsViewModel(title: viewModel.movies[indexPath.item].title, items: viewModel.movies[indexPath.item].movieItems))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 250)
    }
}

