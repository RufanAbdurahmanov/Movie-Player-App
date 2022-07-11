//
//  TvCastsModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 04.07.22.
//

import Foundation

// MARK: - TvCasts
struct TvCasts: Codable {
    let cast, crew: [TvCast]?
    let id: Int?
}

// MARK: - TvCast
struct TvCast: Codable {
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment, name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let character, creditID: String?
    let order: Int?
    let department, job: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}
