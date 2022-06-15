//
//  MovieDetailsViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 08.06.22.
//

import Foundation


class MovieDetailsViewModel {
    
    var movieDetails: MovieDetails?
//    var videos = [VideoResult]()
    var movieCasts = [MovieCast]()
    
    var id: Int!
    
    init() {}
    
    init(id: Int) {
        self.id = id
    }
    
    func getMovieDetails(complete: @escaping()->()) {
        WebService.shared.getMovieDetails(id: id) { [unowned self] details in
            self.movieDetails = details
            complete()
        }
    }
    
    func getCasts(complete: @escaping()->()) {
        WebService.shared.getMovieCasts(id: id) { casts in
            self.movieCasts = casts
            complete()
        }
    }
    
}
