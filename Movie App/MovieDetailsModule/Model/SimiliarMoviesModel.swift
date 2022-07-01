//
//  SimiliarMoviesModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 30.06.22.
//

import Foundation

// MARK: - SimiliarMovies
struct SimiliarMovies: Codable {
    let page: Int?
    let results: [SimiliarMoviesResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - SimiliarMoviesResult
struct SimiliarMoviesResult: Codable, CellProtocol {
    let adult: Bool?
    let backdropPath: String?
    var url: String? { return backdropPath }
    let genreIDS: [Int]?
    let id: Int?
    var cellId: Int? { return id }
    let title: String?
    let originalLanguage: String?
    let originalTitle, overview: String?
    var cellTitle: String? { return originalTitle }
    let popularity: Double?
    let posterPath, releaseDate: String?
    var date: String? { return releaseDate }
    let video: Bool?
    let voteAverage: Double?
    var vote: Double? { return voteAverage}
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
