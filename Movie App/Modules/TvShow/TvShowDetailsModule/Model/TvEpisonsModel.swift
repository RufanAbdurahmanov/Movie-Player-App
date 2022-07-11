//
//  TvEpisonsModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 04.07.22.
//

import Foundation

// MARK: - TvEpisonds
struct TvEpisonds: Codable {
    let airDate: String?
    let crew: [EpisodCrew]?
    let episodeNumber: Int?
    let guestStars: [EpisodCrew]?
    let name, overview: String?
    let id: Int?
    let productionCode: String?
    let runtime, seasonNumber: Int?
    let stillPath: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case crew
        case episodeNumber = "episode_number"
        case guestStars = "guest_stars"
        case name, overview, id
        case productionCode = "production_code"
        case runtime
        case seasonNumber = "season_number"
        case stillPath = "still_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - EpisodCrew
struct EpisodCrew: Codable {
    let job: String?
    let department: String?
    let creditID: String?
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: String?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let character: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case job, department
        case creditID = "credit_id"
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case character, order
    }
}


