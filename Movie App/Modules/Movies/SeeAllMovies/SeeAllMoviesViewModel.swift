//
//  SeeAllMoviesViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 30.06.22.
//

import Foundation

class SeeAllMoviesViewModel {
    
    var movieType = ""
    var movies = [CellProtocol]()
    
    init() {}
    
    init(movieType: String, movies: [CellProtocol]) {
        self.movies = movies
        self.movieType = movieType 
    }
    
    
}
