//
//  PlayerCollectionViewCell.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 14.06.22.
//

import UIKit
import youtube_ios_player_helper

class PlayerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var playerView: YTPlayerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(id: String) {
        playerView.load(withVideoId: id)
    }
}
