//
//  DetailsTableViewCell.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 09.06.22.
//

import UIKit
import youtube_ios_player_helper

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
    
    var castss = [MovieCast]()
    var cellID = "\(MovieCastCollectionViewCell.self)"
    
    var trailerView = Bundle.main.loadNibNamed("\(TrailerView.self)", owner: nil)?.first as! TrailerView
    
    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .clear
        starImageView.image = UIImage(systemName: "star.fill")
        clockImageView.image = UIImage(systemName: "clock")
        castCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        trailerView.frame = videoPlayer.bounds
        videoPlayer.addSubview(trailerView)
    }
    
    func configure(id: String, details: MovieDetails, casts: [MovieCast]) {
        self.castss = casts
        trailerView.configure(id: id)
        castCollectionView.reloadData()
        
        var companyName = ""
        var categories = ""
        
        imageeView.loadImage(imageURL: details.backdropPath ?? "")
        nameLabel.text = details.originalTitle ?? ""
        taglineLabel.text = details.tagline ?? ""
        
        for company in details.productionCompanies! {
            companyName += "  \(String(describing: company.name ?? ""))"
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
    var callback: (()->())?
    
    @IBAction func seeAllButton(_ sender: Any) {
        callback!()
    }
    
}

extension DetailsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castss.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MovieCastCollectionViewCell
        if !castss.isEmpty {
            cell.configure(cast: castss[indexPath.item])
        }
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height)
    }
}
