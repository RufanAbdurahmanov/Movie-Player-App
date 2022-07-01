//
//  TMoviesCollectionViewCell.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 01.06.22.
//

import UIKit

protocol CellProtocol {
    var cellId: Int? { get }
    var url: String? { get }
    var cellTitle: String? { get }
    var vote: Double? { get }
    var date : String? { get }
}
extension CellProtocol {
    var cellId: Int? { return 0 }
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
        layer.cornerRadius = 5
        
    }
    
    func configure(data: CellProtocol) {
        self.imageView.loadImage(imageURL: data.url ?? "")
        self.dateLabel.text = data.date
        self.nameLabel.text = data.cellTitle
        self.ratingLabel.text = "\(round((data.vote ?? 0.0)*10)/10.0)"
    }
    
}
