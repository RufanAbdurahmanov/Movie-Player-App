//
//  TrendingTVModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 31.05.22.
//

import Foundation

// MARK: - TV
struct TV: Codable {
    let page: Int?
    let results: [TVResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - TVResult
struct TVResult: Codable, CellProtocol {
    let voteAverage: Double?
    var vote: Double? {
        voteAverage
    }
    
    let id: Int?
    var cellId: Int? { id }
    let originalName: String?
    var cellTitle: String? {
        originalName
    }
    let originCountry: [String]?
    let voteCount: Int?
    let backdropPath: String?
    var url: String? {
        backdropPath
    }
    let firstAirDate: String?
    var date: String? {
        firstAirDate
    }
    let genreIDS: [Int]?
    let overview: String?
    let originalLanguage: String?
    let name, posterPath: String?
    let popularity: Double?
    let mediaType: String?

    enum CodingKeys: String, CodingKey {
        case voteAverage = "vote_average"
        case id
        case originalName = "original_name"
        case originCountry = "origin_country"
        case voteCount = "vote_count"
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case overview
        case originalLanguage = "original_language"
        case name
        case posterPath = "poster_path"
        case popularity
        case mediaType = "media_type"
    }
}

