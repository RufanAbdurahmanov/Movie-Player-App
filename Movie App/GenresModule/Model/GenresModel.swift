//
//  GenresModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 02.07.22.
//

import Foundation

// MARK: - Genres
struct Genres: Codable {
    let genres: [Genre]?
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?
}

