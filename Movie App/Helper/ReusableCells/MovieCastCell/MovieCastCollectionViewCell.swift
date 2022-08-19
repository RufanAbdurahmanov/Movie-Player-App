//
//  MovieCastCollectionViewCell.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 13.06.22.
//

import UIKit

protocol MovieCastProtocol {
    var personOriginalName: String? { get }
    var url: String? { get }
    var characterName: String? { get }
    
}

extension MovieCastProtocol {
    var personOriginalName: String? { return "" }
    var url: String? { return "" }
    var characterName: String? { return "" }
}

class MovieCastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var characterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 74/255, alpha: 1.0).withAlphaComponent(0.3)
        layer.cornerRadius = 8
    }
    
    func configure(cast: MovieCastProtocol) {
        imageView.loadImage(imageURL: cast.url ?? "")
        nameLabel.text = cast.personOriginalName ?? ""
        characterLabel.text = cast.characterName ?? ""
    }

}
