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

        //backgroundColor = .lightBlueColor.withAlphaComponent(0.3)
        backgroundColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 74/255, alpha: 1.0).withAlphaComponent(0.3)
        layer.cornerRadius = 8
        //layer.borderWidth = 0.6
        //layer.borderColor = UIColor.gray.cgColor
    }

    func configure(item: Genre) {
        self.nameLabel.text = item.name
    }
}
