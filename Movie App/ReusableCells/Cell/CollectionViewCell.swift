//
//  TMoviesCollectionViewCell.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 01.06.22.
//

import UIKit

protocol CellProtocol {
    var url: String? { get }
    var cellTitle: String? { get }
    var vote: Double? { get }
    var date : String? { get }
}
extension CellProtocol {
    var url: String? { return "" }
    var cellTitle: String? { return "" }
    var vote: Double? { return 0.0 }
    var date : String? { return "" }
}


class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.borderWidth = 0.25
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 10
    }

    
    func configure(data: MovieItem) {
        print("data: \(data)")
        self.imageView.loadImage(imageURL: data.url!)
        self.dateLabel.text = data.releaseDate
        self.nameLabel.text = data.title
        self.ratingLabel.text = "\(data.voteAvarage ?? 0.0)"
    }
    
//    func setGradient() {
//        let gradient = CAGradientLayer()
//        gradient.colors = [ UIColor.clear.cgColor, UIColor.systemBackground.cgColor]
//        gradient.frame = imageView.bounds
//        imageView.layer.addSublayer(gradient)
//    }
    
    
}
