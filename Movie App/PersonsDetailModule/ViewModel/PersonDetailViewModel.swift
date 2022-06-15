//
//  PersonDetailViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 13.06.22.
//

import Foundation

struct PersonsDetailViewModel {
    
    var casts = [MovieCast]()
    
    init() {}
    
    init(casts: [MovieCast]) {
        self.casts = casts
    }
    
    func numberOfItems() -> Int {
        return casts.count
    }
    
    func itemAtCell(index: Int) -> MovieCast {
        casts[index]
    }
    
}
