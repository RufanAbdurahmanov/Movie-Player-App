//
//  ComingSoonViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 06.06.22.
//

import Foundation


class ComingSoonViewModel {
    
    var upcomingMovies = [UpcomingMovieResult]()
    
    
    func getComingSoonMovies(complete: @escaping()->()) {
        WebService.shared.getUpcomingMovies(page: 1) { [unowned self] upcomingMovies, error in
            if error == nil, upcomingMovies != nil {
                self.upcomingMovies = upcomingMovies!
            }
            complete()
        }
    }
    
    func numberOfItems() -> Int {
        return upcomingMovies.count
    }
    
    func itemAtCell(index: Int) -> UpcomingMovieResult {
        return upcomingMovies[index]
    }
    
}






