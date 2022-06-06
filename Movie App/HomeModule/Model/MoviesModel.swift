//
//  MoviesModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 04.06.22.
//

import Foundation


struct Movies {
    var title: String
    var movieItems: [MovieItem]
}

struct MovieItem {
    let title: String?
    let url: String?
    let voteAvarage: Double?
    let releaseDate: String?
}
