//
//  TopRatedModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 03.06.22.
//

import Foundation

// MARK: - PopularMovies
struct PopularMovies: Codable {
    let page: Int?
    let results: [PopularResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - PopularResult
struct PopularResult: Codable, CellProtocol {
    let adult: Bool?
    let backdropPath: String?
    var url: String? {
        backdropPath
    }
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle: String?
    var cellTitle: String? { originalTitle }
    let overview: String?
    let popularity: Double?
    let posterPath, releaseDate: String?
    var date: String? { releaseDate }
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    var vote: Double? { voteAverage }
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


