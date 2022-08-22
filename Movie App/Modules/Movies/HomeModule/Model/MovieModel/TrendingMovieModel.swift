//
//  TrendingModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 31.05.22.
//

import Foundation

// MARK: - TrendingMovie
struct TrendingMovie: Codable {
    let page: Int?
    let results: [TrendingMovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - TrendingMovieResult
struct TrendingMovieResult: Codable, CellProtocol {
    
    let releaseDate: String?
    var date: String? { releaseDate }
    let adult: Bool?
    let backdropPath: String?
    var url: String? { backdropPath }
    let genreIDS: [Int]?
    let voteCount: Int?
    let originalLanguage, originalTitle: String?
    var cellTitle: String? { originalTitle }
    let posterPath, title: String?
    let video: Bool?
    let voteAverage: Double?
    var vote: Double? { voteAverage }
    let id: Int?
    var cellId: Int? { id }
    let overview: String?
    let popularity: Double?
    let mediaType: String?

    enum CodingKeys: String, CodingKey {
        case releaseDate = "release_date"
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case voteCount = "vote_count"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case title, video
        case voteAverage = "vote_average"
        case id, overview, popularity
        case mediaType = "media_type"
    }
}

