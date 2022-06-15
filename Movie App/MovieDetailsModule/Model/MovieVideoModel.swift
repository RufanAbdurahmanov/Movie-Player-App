//
//  MovieVideoModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 09.06.22.
//

import Foundation

/*
 "id": 648579,
     "results": [
         {
             "iso_639_1": "en",
             "iso_3166_1": "US",
             "name": "Official Clip “Oh My God”",
             "key": "kWkdYnAvg0g",
             "site": "YouTube",
             "size": 1080,
             "type": "Clip",
             "official": true,
             "published_at": "2022-04-12T17:40:23.000Z",
             "id": "625e92e719690c0051cd588f"
         }
 */

// MARK: - VideoDetails
struct VideoDetails: Codable {
    let id: Int?
    let results: [VideoResult]?
}

// MARK: - VideoResult
struct VideoResult: Codable {
    let iso639_1: String?
    let iso3166_1: String?
    let name, key: String?
    let site: String?
    let size: Int?
    let type: String?
    let official: Bool?
    let publishedAt, id: String?

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name, key, site, size, type, official
        case publishedAt = "published_at"
        case id
    }
}
