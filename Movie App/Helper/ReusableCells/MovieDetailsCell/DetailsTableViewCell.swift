//
//  DetailsTableViewCell.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 09.06.22.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var videoPlayer: UIView!
    @IBOutlet weak private var starImageView: UIImageView!
    @IBOutlet weak private var clockImageView: UIImageView!
    
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var taglineLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    
    @IBOutlet weak private var voteLabel: UILabel!
    @IBOutlet weak private var runtimeLabel: UILabel!
    
    @IBOutlet weak private var overviewLabel: UILabel!
    @IBOutlet weak private var castCollectionView: UICollectionView!
    @IBOutlet weak private var releaseDateLabel: UILabel!
    
    @IBOutlet weak var similiarMoviesLabel: UILabel!
    
    @IBOutlet weak var similiarMoviesCollectionView: UICollectionView!
    
    @IBOutlet weak var genresStackView: UIStackView!
    @IBOutlet weak var genre1Label: UILabel!
    @IBOutlet weak var genre2Label: UILabel!
    
    
    
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
        setUpGenreUI()
        
    }
    
    func setUpGenreUI() {
        genresStackView.backgroundColor = .clear
        genre1Label.font = .systemFont(ofSize: 17, weight: .medium)
        //genre1Label.backgroundColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 74/255, alpha: 1.0).withAlphaComponent(0.3)
        genre1Label.backgroundColor = .clear
        genre1Label.layer.borderWidth = 0.9
        genre1Label.layer.borderColor = UIColor.lightGray.cgColor
        genre1Label.tintColor = .white
        genre1Label.layer.cornerRadius = 7
        
        genre2Label.backgroundColor = .clear
        genre2Label.font = .systemFont(ofSize: 17, weight: .medium)
        genre2Label.layer.borderWidth = 0.9
        genre2Label.layer.borderColor = UIColor.lightGray.cgColor
        genre2Label.tintColor = .white
        genre2Label.layer.cornerRadius = 7
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
        DispatchQueue.main.async {
            self.castCollectionView.reloadData()
            self.similiarMoviesCollectionView.reloadData()
        }
        
        var languages = ""
        
        nameLabel.text = details.originalTitle ?? ""
        taglineLabel.text = details.tagline ?? ""

        voteLabel.text = "\(round((details.voteAverage ?? 0.0)*10)/10.0)"
        //runtimeLabel.text = String("\((details.runtime ?? 0)/60)h \((details.runtime ?? 0)%60)m")
        runtimeLabel.text = "\(details.runtime ?? 10) minutes"
        
        
        genre1Label.text = details.genres?.first?.name ?? ""
        genre2Label.text = details.genres?[1].name ?? ""
        
        if details.spokenLanguages != nil {
            if details.spokenLanguages!.count <= 2 {
                for language in details.spokenLanguages ?? [] {
                    languages += "\(String(describing: language.englishName ?? "")), "
                }
            } else {
                for i in 1...2 {
                    languages += "\(String(describing: details.spokenLanguages![i].englishName ?? "")), "
                }

            }
        }
        languagesLabel.text = String(languages.dropLast(2))
        
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
        }else {
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
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
}
