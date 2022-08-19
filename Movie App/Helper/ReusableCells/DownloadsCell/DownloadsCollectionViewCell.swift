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
        backgroundColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 74/255, alpha: 1.0).withAlphaComponent(0.3)
        layer.cornerRadius = 6
    }
    
    func configure(item: DownloadedTrailerModel) {
        self.movieNameLabel.text = item.movieName
        self.trailerNameLabel.text = item.trailerName
    }

}
