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

struct CellItem: CellProtocol{
    let id: Int?
    var cellId: Int? { return id }
    let title: String?
    var cellTitle: String? { return title }
    let url: String?
    var cellUrl: String? { return url }
    let voteAvarage: Double?
    var vote: Double? { return voteAvarage }
    let releaseDate: String?
    var date: String? { return releaseDate }
}
