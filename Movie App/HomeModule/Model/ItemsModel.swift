//
//  ItemsModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 04.06.22.
//

import Foundation


struct Items{
    var title: String
    var cellItems: [CellItem]
}

struct CellItem {
    let id: Int?
    let title: String?
    let url: String?
    let voteAvarage: Double?
    let releaseDate: String?
}
