//
//  GenreCollectionViewCell.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 02.07.22.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .lightBlueColor.withAlphaComponent(0.3)
        layer.cornerRadius = 6
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.gray.cgColor
    }

    func configure(item: Genre) {
        self.nameLabel.text = item.name
    }
}
