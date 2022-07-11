//
//  TvSeasonsModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 04.07.22.
//

import Foundation

// MARK: - TvSeasons
struct TvSeasons: Codable {
    let id, airDate: String?
    let episodes: [Episode]?
    let name, overview: String?
    let tvSeasonsID: Int?
    let posterPath: String?
    let seasonNumber: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case airDate = "air_date"
        case episodes, name, overview
        case tvSeasonsID = "id"
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
    }
}

// MARK: - Episode
struct Episode: Codable {
    let airDate: String?
    let episodeNumber: Int?
    let crew, guestStars: [TVCrew]?
    let id: Int?
    let name, overview, productionCode: String?
    let runtime, seasonNumber: Int?
    let stillPath: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeNumber = "episode_number"
        case crew
        case guestStars = "guest_stars"
        case id, name, overview
        case productionCode = "production_code"
        case runtime
        case seasonNumber = "season_number"
        case stillPath = "still_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - TVCrew
struct TVCrew: Codable {
    let job: Job?
    let department: Department?
    let creditID: String?
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: Department?
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

enum Department: String, Codable {
    case acting = "Acting"
    case costumeMakeUp = "Costume & Make-Up"
    case crew = "Crew"
    case directing = "Directing"
    case editing = "Editing"
    case production = "Production"
    case writing = "Writing"
}

enum Job: String, Codable {
    case director = "Director"
    case editor = "Editor"
    case story = "Story"
    case stuntDouble = "Stunt Double"
    case teleplay = "Teleplay"
    case unitProductionManager = "Unit Production Manager"
    case writer = "Writer"
}

