//
//  TvShowsModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 09.06.22.
//

import Foundation

struct TvShows {
    var title: String
    var tvItems: [TvItem]
}

struct TvItem {
    let id: Int?
    let title: String?
    let url: String?
    let voteAvarage: Double?
    let releaseDate: String?
}
