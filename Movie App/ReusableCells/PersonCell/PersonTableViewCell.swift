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
    @IBOutlet weak var alsoKnownLabel: UILabel!
    @IBOutlet weak var birthPlaceLabel: UILabel!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var deathdayLabel: UILabel!
    var url: String?
    var callback: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func homePageButton(_ sender: Any) {
        callback?()
    }
    
    func configure(data: Person) {
        var alsoKnown = ""
        personImageView.loadImage(imageURL: data.profilePath ?? "")
        nameLabel.text = data.name ?? ""
        voteLabel.text = "7.1"
        if data.alsoKnownAs != nil {
            for text in data.alsoKnownAs! {
                alsoKnown += " \(text)"
            }
        }
        biographyLabel.text = data.biography ?? ""
        birthPlaceLabel.text = data.placeOfBirth
        alsoKnownLabel.text = alsoKnown
        birthdayLabel.text = data.birthday ?? "unknown"
        deathdayLabel.text = data.deathday ?? "still alive"
    }
    
    
}
