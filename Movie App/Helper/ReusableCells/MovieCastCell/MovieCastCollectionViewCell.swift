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
        // Initialization code
        backgroundColor = .lightBlueColor.withAlphaComponent(0.3)
        layer.cornerRadius = 6
        layer.borderWidth = 0.07
        layer.borderColor = UIColor.white.cgColor
    }
    
    func configure(cast: MovieCastProtocol) {
        imageView.loadImage(imageURL: cast.url ?? "")
        nameLabel.text = cast.personOriginalName ?? ""
        characterLabel.text = cast.characterName ?? ""
    }

}
