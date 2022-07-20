//
//  DownloadsCollectionViewCell.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 21.06.22.
//

import UIKit

class DownloadsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var movieNameLabel: UILabel!
    @IBOutlet weak private var trailerNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .lightBlueColor.withAlphaComponent(0.3)
        layer.cornerRadius = 6
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.gray.cgColor
    }
    
    func configure(item: DownloadedTrailerModel) {
        self.movieNameLabel.text = item.movieName
        self.trailerNameLabel.text = item.trailerName
    }

}
