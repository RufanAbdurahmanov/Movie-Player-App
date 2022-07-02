//
//  DetailsTableViewCell.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 09.06.22.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var videoPlayer: UIView!
    @IBOutlet weak private var imageeView: UIImageView!
    @IBOutlet weak private var starImageView: UIImageView!
    @IBOutlet weak private var clockImageView: UIImageView!
    
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var taglineLabel: UILabel!
    @IBOutlet weak private var companiesLabel: UILabel!
    @IBOutlet weak private var budgetLabel: UILabel!
    @IBOutlet weak private var revenueLabel: UILabel!
    @IBOutlet weak private var voteLabel: UILabel!
    @IBOutlet weak private var runtimeLabel: UILabel!
    @IBOutlet weak private var categoriesLabel: UILabel!
    
    @IBOutlet weak private var overviewLabel: UILabel!
    @IBOutlet weak private var castCollectionView: UICollectionView!
    @IBOutlet weak private var releaseDateLabel: UILabel!
    
    @IBOutlet weak var similiarMoviesLabel: UILabel!
    
    @IBOutlet weak var similiarMoviesCollectionView: UICollectionView!
    
    var castss = [MovieCast]()
    var similarMovies = [SimiliarMoviesResult]()
    var cellID = "\(MovieCastCollectionViewCell.self)"
    var similarMoviesCellID = "\(CollectionViewCell.self)"
    
    var trailerView = Bundle.main.loadNibNamed("\(TrailerView.self)", owner: nil)?.first as! TrailerView
    
    var callBackToMovieDetails: ((VideoResult)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .clear
        starImageView.image = UIImage(systemName: "star.fill")
        clockImageView.image = UIImage(systemName: "clock")
        castCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        similiarMoviesCollectionView.register(UINib(nibName: similarMoviesCellID, bundle: nil), forCellWithReuseIdentifier: similarMoviesCellID)
        similiarMoviesCollectionView.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        trailerView.frame = videoPlayer.bounds
        videoPlayer.addSubview(trailerView)
        
        trailerView.callBackForVideoID = { item in
            self.callBackToMovieDetails?(item)
        }
    }
    
    func configure(id: String, details: MovieDetails, casts: [MovieCast], similarMovies: [SimiliarMoviesResult]) {
        self.castss = casts
        self.similarMovies = similarMovies
        trailerView.configure(id: id)
        castCollectionView.reloadData()
        similiarMoviesCollectionView.reloadData()
        
        var companyName = ""
        var categories = ""
        
        imageeView.loadImage(imageURL: details.backdropPath ?? "")
        nameLabel.text = details.originalTitle ?? ""
        taglineLabel.text = details.tagline ?? ""
        
        for company in details.productionCompanies! {
            companyName += "\(String(describing: company.name ?? ""))\n"
        }
        
        companiesLabel.text = companyName
        budgetLabel.text = "$\(String(describing: details.budget!.withCommas()))"
        revenueLabel.text = "$\(String(describing: details.revenue!.withCommas()))"
        voteLabel.text = String(details.voteAverage ?? 0.0)
        runtimeLabel.text = String("\((details.runtime ?? 0)/60)h \((details.runtime ?? 0)%60)m")
        
        for category in details.genres! {
            categories += "  \(String(describing: category.name ?? ""))"
        }
        categoriesLabel.text = categories
        overviewLabel.text = details.overview ?? ""
        releaseDateLabel.text = details.releaseDate ?? ""
    }
    var callbackSeeAllCast: (()->())?
    @IBAction func seeAllButton(_ sender: Any) {
        callbackSeeAllCast!()
    }
    var callbackSeeAllSimilarMovies: (()->())?
    @IBAction func seeAllMoviesButton(_ sender: Any) {
        callbackSeeAllSimilarMovies!()
    }
    
    
    var callBackToMovieDetailsVCForCasts:((Int)->())?
    var callBackToMovieDetailsVCForMovies:((SimiliarMoviesResult)->())?
}

extension DetailsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == castCollectionView {
            return castss.count
        } else {
            return similarMovies.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == castCollectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MovieCastCollectionViewCell
        if !castss.isEmpty {
            cell.configure(cast: castss[indexPath.item])
        }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: similarMoviesCellID, for: indexPath) as! CollectionViewCell
            if !similarMovies.isEmpty {
                cell.configure(data: similarMovies[indexPath.item])
                cell.backgroundColor = .lightBlueColor.withAlphaComponent(0.3)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == castCollectionView {
            callBackToMovieDetailsVCForCasts!(indexPath.item)
        } else {
            callBackToMovieDetailsVCForMovies!(similarMovies[indexPath.item])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height)
    }
}
