//
//  MovieDetailsViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 08.06.22.
//

import UIKit
import Cosmos
import AVKit
import PanModal

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let cellID = "\(DetailsTableViewCell.self)"
    let playerController = AVPlayerViewController()
    
    var rate: Double?
    
    lazy var ratingView: CosmosView = {
        let view = CosmosView()
        return view
    }()
    
    var viewModel = MovieDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.setTwoGradient(colorOne: UIColor.lightBlueColor, colorTwo: UIColor.darkBlueColor)
        view.backgroundColor = UIColor.darkBlueColor
        
        getDatas()
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        tableView.backgroundColor = .clear
        
        let rateMovieButton = UIBarButtonItem(title: "Rate", style: .plain, target: self, action: #selector(rateMovie))
        let downloadButton = UIBarButtonItem(image: UIImage(systemName: "arrow.down.to.line.compact"), style: .plain, target: self, action: #selector(downloadMovie))
        downloadButton.tintColor = #colorLiteral(red: 0.9840000272, green: 0, blue: 0.172999993, alpha: 1)
        rateMovieButton.tintColor = #colorLiteral(red: 0.9840000272, green: 0, blue: 0.172999993, alpha: 1)
        navigationItem.rightBarButtonItems = [downloadButton, rateMovieButton]
        
    }
    
    var item: VideoResult!
    
    @objc func downloadMovie() {
        let panmodalVC = self.storyboard?.instantiateViewController(withIdentifier: "\(PanModalViewController.self)") as! PanModalViewController
        viewModel.downloadTrailer(item: item, cancelDownload: false) { errorMessage, progress in
            if errorMessage != nil {
                // show alert
            } else if progress! < 1.0 {
                panmodalVC.progress = Float(progress ?? 0.0)
            } else {
                panmodalVC.progress = Float(progress ?? 0.0)
                self.tabBarController?.selectedIndex = 2
            }
        }
        panmodalVC.cancelCallBack = {
            self.viewModel.downloadTrailer(item: self.item, cancelDownload: true) { errorMassage, progress in
                if let errorMassage = errorMassage {
                    print("message:\(String(describing: errorMassage)) \n progress: \(String(describing: progress))")
                } else {
                    print("Cancel")
                }
            }
        }
        self.presentPanModal(panmodalVC)
    }
    
    @objc func rateMovie() {
        //Alert for the rating
        let alert = UIAlertController(title: "\n\n", message: "", preferredStyle: .alert)
        //The x/y coordinate of the rating view
        let xCoord = alert.view.frame.width/2 - 160 
        let yCoord = CGFloat(30.0)
        
        ratingView.rating = 0.0
        ratingView.settings.starSize = 30
        ratingView.settings.emptyBorderColor = UIColor.black
        ratingView.settings.fillMode = .half
        ratingView.settings.updateOnTouch = true
        ratingView.frame.origin.x = xCoord
        ratingView.frame.origin.y = yCoord
        ratingView.didTouchCosmos = { [weak self] rating in
            self?.rate = rating
        }
        
        alert.addAction(UIAlertAction(title: "Rate", style: .default, handler: { [weak self] alert in
            self?.viewModel.rateMovie(point: Float(self?.rate ?? 0.0)) { response in
                if let success = response.success, success {
                    self?.alertRateMessage(title: "Success", message: response.statusMessage ?? "")
                } else {
                    self?.alertRateMessage(title: "Error", message: response.statusMessage ?? "")
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { [weak self] _ in
            self?.rate = nil
        }))
        
        alert.view.addSubview(ratingView)
        present(alert, animated: true, completion: nil)
    }
    
    func getDatas() {
        self.viewModel.getMovieDetails{
            self.viewModel.getCasts {
                self.viewModel.getSilimiarMovies {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func alertRateMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true, completion: nil)
    }
}

extension MovieDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DetailsTableViewCell
        if viewModel.movieDetails != nil {
            cell.configure(id: "\(viewModel.id ?? 0)", details: viewModel.movieDetails!, casts: viewModel.movieCasts, similarMovies: viewModel.similarMovies)
        }
        cell.callbackSeeAllCast = { [self] in
            let personsDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "\(PersonsDetailViewController.self)") as! PersonsDetailViewController
            personsDetailVC.viewModel = PersonsDetailViewModel(casts: viewModel.movieCasts)
            self.navigationController?.show(personsDetailVC, sender: nil)
        }
        cell.callbackSeeAllSimilarMovies = { [self] in
            let seeAllMoviesVC = storyboard?.instantiateViewController(withIdentifier: "\(SeeAllMoviesViewController.self)") as! SeeAllMoviesViewController
            seeAllMoviesVC.viewModel = SeeAllMoviesViewModel(movies: viewModel.similarMovies)
            self.navigationController?.show(seeAllMoviesVC, sender: nil)
        }
        cell.callBackToMovieDetails = { item in
            self.item = item
        }
        
        cell.callBackToMovieDetailsVCForCasts = { index in
            let personVC = self.storyboard?.instantiateViewController(withIdentifier: "\(PersonViewController.self)") as! PersonViewController
            personVC.viewModel = PersonViewModel(id: self.viewModel.movieCasts[index].id ?? 0)
            self.navigationController?.show(personVC, sender: nil)
        }
        
        cell.callBackToMovieDetailsVCForMovies =  { movie in
            let detailsID = "\(MovieDetailsViewController.self)"
            let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: detailsID) as! MovieDetailsViewController
            
            detailsVC.viewModel = MovieDetailsViewModel(id: movie.cellId!, name: movie.cellTitle!)
            self.navigationController?.show(detailsVC, sender: nil)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
