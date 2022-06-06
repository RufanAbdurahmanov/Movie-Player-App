//
//  ComingSoonViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 06.06.22.
//

import Foundation


class ComingSoonViewModel {
    
    var upcomingMovies = [UpcomingResult]()
    
    
    func getComingSoonMovies(complete: @escaping()->()) {
        WebService.shared.getUpcomingMovies(page: 1) { [unowned self] upcomingMovies in
            self.upcomingMovies = upcomingMovies
            complete()
        }
    }
    
    func numberOfItems() -> Int {
        return upcomingMovies.count
    }
    
    func itemAtCell(index: Int) -> UpcomingResult {
        return upcomingMovies[index]
    }
    
}






