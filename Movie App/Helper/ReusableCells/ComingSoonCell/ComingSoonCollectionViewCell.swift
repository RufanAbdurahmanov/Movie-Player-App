//
//  ComingSoonCollectionViewCell.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 06.06.22.
//

import UIKit

class ComingSoonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var voteLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var starImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 74/255, alpha: 1.0).withAlphaComponent(0.3)
        layer.cornerRadius = 6
    }
    
    func configure(item: CellProtocol) {
        starImageView.image = UIImage(systemName: "star.fill")
        imageView.loadImage(imageURL: item.url ?? "")
        titleLabel.text = item.cellTitle
        voteLabel.text = "\(item.vote ?? 0.0)"
        dateLabel.text = item.date
    }

}
