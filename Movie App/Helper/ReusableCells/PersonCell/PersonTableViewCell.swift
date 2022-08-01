//
//  PersonTableViewCell.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 14.06.22.
//

import UIKit
import SafariServices

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homePageButton: UIButton!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var birthPlaceLabel: UILabel!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var deathdayLabel: UILabel!
    
    @IBOutlet weak var filmographyLabel: UILabel!
    @IBOutlet weak var personMoviesCollectionView: UICollectionView!
    let cellID = "\(CollectionViewCell.self)"
    var personsMovies = [Cast]()
    
    var url: String?
    var callback: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
        personMoviesCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func homePageButton(_ sender: Any) {
        callback?()
    }
    
    func configure(data: Person, movies: [Cast]) {
        personsMovies = movies
        personMoviesCollectionView.reloadData()
        var alsoKnown = ""
        personImageView.loadImage(imageURL: data.profilePath ?? "")
        nameLabel.text = data.name ?? ""
        voteLabel.text = "0.0"
        if data.alsoKnownAs != nil {
            for text in data.alsoKnownAs! {
                alsoKnown += " \(text)"
            }
        }
        biographyLabel.text = data.biography ?? ""
        birthPlaceLabel.text = data.placeOfBirth
        birthdayLabel.text = data.birthday ?? "Unknown"
        deathdayLabel.text = data.deathday ?? "Alive"
    }
    
    var callBackAllMovies: (()->())?
    @IBAction func seeAllButton(_ sender: Any) {
        callBackAllMovies!()
    }
    var callBackForMovie: (()->())?
}

extension PersonTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return personsMovies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = personMoviesCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CollectionViewCell
        cell.configure(data: personsMovies[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        callBackForMovie!()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height)
    }
}
