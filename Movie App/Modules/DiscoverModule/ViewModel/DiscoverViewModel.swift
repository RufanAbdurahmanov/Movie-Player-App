//
//  DiscoverViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 02.07.22.
//

import Foundation


class DiscoverViewModel {
    
    var movies = [DiscoverResult]()
    var genres = [Genre]()
    
    var genreID: Int!
    
    init() {}
    init(id: Int) {
        self.genreID = id
    }
    
    
    
    func getGenres(complete: @escaping()->()) {
        WebService.shared.getGenres { genres in
            self.genres = genres
            complete()
        }
    }
    
    func getDiscoverMovies(complete: @escaping()->()) {
        WebService.shared.getDiscoverMovies(genreID: genreID, page: 1) { [unowned self] discoverMovies in
            self.movies = discoverMovies
            complete()
        }
    }
}
