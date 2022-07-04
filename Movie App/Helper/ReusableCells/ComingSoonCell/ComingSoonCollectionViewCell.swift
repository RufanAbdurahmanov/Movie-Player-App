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
        //backgroundColor = UIColor(red: 40/255, green: 51/255, blue: 64/255, alpha: 1)
        backgroundColor = .lightBlueColor.withAlphaComponent(0.3)
        layer.cornerRadius = 6
        layer.borderWidth = 0.07
        layer.borderColor = UIColor.white.cgColor
    }
    
    func configure(item: CellProtocol) {
        starImageView.image = UIImage(systemName: "star.fill")
        imageView.loadImage(imageURL: item.url ?? "")
        titleLabel.text = item.cellTitle
        voteLabel.text = "\(item.vote ?? 0.0)"
        dateLabel.text = item.date
    }

}
