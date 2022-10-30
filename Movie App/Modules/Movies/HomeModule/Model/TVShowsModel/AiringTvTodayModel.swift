//
//  AiringTvTodayModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 09.06.22.
//

import Foundation

// MARK: - AiringTv
struct AiringTv: Codable {
    let page: Int?
    let results: [AiringResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - AiringResult
struct AiringResult: Codable, CellProtocol {
    let backdropPath: String?
    let firstAirDate: String?
    var date: String? { firstAirDate }
    let genreIDS: [Int]?
    let id: Int?
    var cellId: Int? { id }
    let name: String?
    let originCountry: [String]?
    let originalLanguage, originalName, overview: String?
    var cellTitle: String? { originalName }
    let popularity: Double?
    let posterPath: String?
    var url: String? { posterPath }
    let voteAverage: Double?
    var vote: Double? { voteAverage }
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id, name
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
