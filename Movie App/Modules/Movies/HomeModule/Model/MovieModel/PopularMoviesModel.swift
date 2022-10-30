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
    let results: [PopularMovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - PopularResult
struct PopularMovieResult: Codable, CellProtocol {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    var cellId: Int? { id }
    let originalLanguage, originalTitle: String?
    var cellTitle: String? { originalTitle }
    let overview: String?
    let popularity: Double?
    let posterPath, releaseDate: String?
    var url: String? { posterPath }
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


