//
//  SeeAllMoviesViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 30.06.22.
//

import Foundation

class SeeAllMoviesViewModel {
    
    var movies = [CellProtocol]()
    
    init() {}
    
    init(movies: [CellProtocol]) {
        self.movies = movies
    }
    
    
}
