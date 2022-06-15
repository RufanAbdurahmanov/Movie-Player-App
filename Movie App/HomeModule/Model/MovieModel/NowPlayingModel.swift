//
//  NowPlayingModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 06.06.22.
//

import Foundation

// MARK: - NowPlayingMovies
struct NowPlayingMovies: Codable {
    let dates: Dates
    let page: Int
    let results: [NowPlayingMovieResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String
}

// MARK: - NowPlayingMovieResult
struct NowPlayingMovieResult: Codable, CellProtocol {
    let adult: Bool
    let backdropPath: String
    var url: String? { backdropPath }
    let genreIDS: [Int]
    let id: Int
    var cellId: Int? { id }
    let originalLanguage: String?
    let originalTitle, overview: String
    var cellTitle: String? { originalTitle }
    let popularity: Double
    let posterPath, releaseDate, title: String
    var date: String? { releaseDate }
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    var vote: Double? { Double(voteAverage) }

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
