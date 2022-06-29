//
//  RatePostModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 22.06.22.
//

import Foundation

// MARK: - RatePostModel
struct RatePostModel: Codable {
    let success: Bool?
    let statusCode: Int?
    let statusMessage: String?

    enum CodingKeys: String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}

