//
//  FilmographyModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 30.06.22.
//

import Foundation

// MARK: - Filmography
struct Filmography: Codable {
    let cast: [Cast]?
    let crew: [Crew]?
    let id: Int?
}

// MARK: - Cast
struct Cast: Codable, CellProtocol {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    var cellId: Int? { return id }
    let title: String?
    let originalLanguage: String?
    let originalTitle, overview: String?
    var cellTitle: String? { return originalTitle }
    let popularity: Double?
    let posterPath: String?
    var url: String? { posterPath }
    let releaseDate: String?
    var date: String? { return releaseDate }
    let video: Bool?
    let voteAverage: Double?
    var vote: Double? { return voteAverage }
    let voteCount: Int?
    let character, creditID: String?
    let order: Int?

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
        case character
        case creditID = "credit_id"
        case order
    }
}

// MARK: - Crew
struct Crew: Codable {
    let id: Int?
    let department, originalLanguage, originalTitle, job: String?
    let overview: String?
    let voteCount: Int?
    let video: Bool?
    let posterPath, backdropPath, title: String?
    let popularity: Double?
    let genreIDS: [Int]?
    let voteAverage: Double?
    let adult: Bool?
    let releaseDate, creditID: String?

    enum CodingKeys: String, CodingKey {
        case id, department
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case job, overview
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case title, popularity
        case genreIDS = "genre_ids"
        case voteAverage = "vote_average"
        case adult
        case releaseDate = "release_date"
        case creditID = "credit_id"
    }
}


