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
        view.backgroundColor = UIColor.darkBlueColor
        
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
                        self.movieCollectonView.reloadData()
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
                            self.tvShowsCollectionView.reloadData()
                        }
                    }
                }
            }
        }
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
            let detailsID = "\(MovieDetailsViewController.self)"
            let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: detailsID) as! MovieDetailsViewController
            if self.segmentedControl.selectedSegmentIndex == 0 {
                detailsVC.viewModel = MovieDetailsViewModel(id: self.movieViewModel.movies[indexPath.item].cellItems[indexPath.item].id!, name: self.movieViewModel.movies[indexPath.item].cellItems[indexPath.item].title!)
                self.navigationController?.show(detailsVC, sender: nil)
            }
            
        }
        
        cell.callBackForSeeAllMovies = {
            let seeAllMoviesVC = self.storyboard?.instantiateViewController(withIdentifier: "\(SeeAllMoviesViewController.self)") as! SeeAllMoviesViewController
            seeAllMoviesVC.viewModel = SeeAllMoviesViewModel(movies: self.movieViewModel.movies[indexPath.item].cellItems)
            self.navigationController?.show(seeAllMoviesVC, sender: nil)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 278)
    }
    
}
