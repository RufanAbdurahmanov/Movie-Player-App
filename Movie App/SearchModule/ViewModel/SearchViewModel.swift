//
//  SearchViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 04.07.22.
//

import Foundation

class SearchViewModel {
    
    var movies = [SearchResult]()
    var query = ""
    
    func getSearch(query: String, complete: @escaping()->() ) {
        WebService.shared.searchMovies(query: query) {[unowned self] movies in
            self.movies.removeAll()
            self.movies = movies
            complete()
        }
    }
    
}
