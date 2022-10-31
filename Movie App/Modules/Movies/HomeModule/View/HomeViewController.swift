//
//  HomeViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 30.05.22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var movieCollectonView: UICollectionView!
    
    @IBOutlet weak var tvShowsCollectionView: UICollectionView!
    
    let cellID = "\(HomeCollectionViewCell.self)"
    let movieViewModel = MovieViewModel()
    let tvShowsViewModel = TvShowsViewModel()
    
    var indexx = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Movie Player"
        //view.setTwoGradient(colorOne: UIColor.lightBlueColor, colorTwo: UIColor.darkBlueColor)
        //view.backgroundColor = UIColor.darkBlueColor
        view.backgroundColor = .black
        
        movieCollectonView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        tvShowsCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        getMovies()
        getTvShows()
        tvShowsCollectionView.isHidden = true
    }
    
    
    @IBAction func changeSegment(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            tvShowsCollectionView.isHidden = true
            movieCollectonView.isHidden = false
            
        } else {
            movieCollectonView.isHidden = true
            tvShowsCollectionView.isHidden = false
           
        }
    }
    
    func getMovies() {
        self.movieViewModel.getMovies {
            self.movieViewModel.getNowPlayingMovies {
                self.movieViewModel.getPopularMovies {
                    self.movieViewModel.getTopRatedMovies {
                        DispatchQueue.main.async {
                            self.movieCollectonView.reloadData()
                        }
                    }
                }
            }
        }
    }
    func getTvShows() {
        self.tvShowsViewModel.getTrendingTVs {
            self.tvShowsViewModel.getAiringTVs {
                self.tvShowsViewModel.getOnTheAirTVs {
                    self.tvShowsViewModel.getPopularTVs {
                        self.tvShowsViewModel.getTopRatedTVs {
                            DispatchQueue.main.async {
                                self.tvShowsCollectionView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
    func alertCoomingSoon() {
        let alertController = UIAlertController(title: "Coming Soon", message: "This module is under development", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == movieCollectonView {
        return movieViewModel.movies.count
        } else {
            return tvShowsViewModel.tvShows.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HomeCollectionViewCell
        self.indexx = indexPath.item
        if collectionView == movieCollectonView {
            cell.configureCell(viewModel: CellsViewModel(title: movieViewModel.movies[indexPath.item].title, items: movieViewModel.movies[indexPath.item].cellItems))
        } else {
            cell.configureCell(viewModel: CellsViewModel(title: tvShowsViewModel.tvShows[indexPath.item].title, items: tvShowsViewModel.tvShows[indexPath.row].cellItems))
        }
        
        cell.cellTapCallback = { index in
            if self.segmentedControl.selectedSegmentIndex == 0 {
                let detailsID = "\(MovieDetailsViewController.self)"
                let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: detailsID) as! MovieDetailsViewController
                if self.segmentedControl.selectedSegmentIndex == 0 {
                    detailsVC.viewModel = MovieDetailsViewModel(id: self.movieViewModel.movies[indexPath.item].cellItems[index].cellId ?? 0, name: self.movieViewModel.movies[indexPath.item].cellItems[index].title!)
                    self.navigationController?.show(detailsVC, sender: nil)
                }
            } else {
                self.alertCoomingSoon()
            }
            
        }
        
        cell.callBackForSeeAllMovies = {
            if self.segmentedControl.selectedSegmentIndex == 0 {
                let seeAllMoviesVC = self.storyboard?.instantiateViewController(withIdentifier: "\(SeeAllMoviesViewController.self)") as! SeeAllMoviesViewController
                seeAllMoviesVC.viewModel = SeeAllMoviesViewModel(movieType: self.movieViewModel.movies[indexPath.item].title, movies: self.movieViewModel.movies[indexPath.item].cellItems)
                self.navigationController?.show(seeAllMoviesVC, sender: nil)
            } else {
                self.alertCoomingSoon()
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 278)
    }
    
}
