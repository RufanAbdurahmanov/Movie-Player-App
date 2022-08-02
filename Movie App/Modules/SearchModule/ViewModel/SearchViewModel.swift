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
        WebService.shared.searchMovies(query: query.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)) {[unowned self] movies, error in
            if error == nil, movies != nil {
                self.movies.removeAll()
                self.movies = movies!
            }
            complete()
        }
    }
    
}
