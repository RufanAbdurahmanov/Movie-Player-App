//
//  MovieCastsModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 13.06.22.
//

import Foundation

// MARK: - MovieCasts
struct MovieCasts: Codable {
    let id: Int?
    let cast, crew: [MovieCast]?
}

// MARK: - MovieCast
struct MovieCast: Codable, MovieCastProtocol {
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: String?
    let name, originalName: String?
    var personOriginalName: String? { originalName }
    let popularity: Double?
    let profilePath: String?
    var url: String? { profilePath }
    let castID: Int?
    let character, creditID: String?
    var characterName: String? { character }
    let order: Int?
    let department: String?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}



