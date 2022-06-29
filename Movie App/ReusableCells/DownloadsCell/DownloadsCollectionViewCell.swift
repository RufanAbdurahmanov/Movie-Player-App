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
        backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.2, blue: 0.2509803922, alpha: 1).withAlphaComponent(0.5)
        //backgroundColor = .clear
    }
    
    func configure(item: DownloadedTrailerModel) {
        self.movieNameLabel.text = item.movieName
        self.trailerNameLabel.text = item.trailerName
    }

}
