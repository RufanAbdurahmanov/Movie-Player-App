//
//  TrendingPersonModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 31.05.22.
//

import Foundation

// MARK: - UpcomingMovies
struct UpcomingMovies: Codable {
    let dates: UpcomigDates?
    let page: Int?
    let results: [UpcomingMovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - UpcomigDates
struct UpcomigDates: Codable {
    let maximum, minimum: String?
}

// MARK: - UpcomingMovieResult
struct UpcomingMovieResult: Codable, CellProtocol {
    let adult: Bool?
    let backdropPath: String?
    var url: String? {
        backdropPath
    }
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle: String
    var cellTitle: String? {
        originalTitle
    }
    let overview: String?
    let popularity: Double?
    let posterPath, releaseDate: String?
    var date: String? {
        releaseDate
    }
    let  title: String?
    let video: Bool?
    let voteAverage: Double?
    var vote: Double? {
        voteAverage
    }
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


