//
//  TvShowDetailsViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 04.07.22.
//

import Foundation

class TvShowDetailsViewModel {
    
    var videos = [TvTrailerResult]()
    var details: TvDetails!
    var seasons: TvSeasons!
    var tvCasts = [TvCast]()
    
    var tvID: Int!
    var seasonNumber: Int!
    init() {}
    
    init(id: Int) {
        self.tvID = id
    }
    
    
    func getTvShowTrailers(complete: @escaping()->()) {
        WebService.shared.getTvShowVideos(id: tvID) { videos, error  in
            if error == nil, videos != nil {
                self.videos = videos!
            }
            complete()
        }
    }
    
    
    func getTvShowDetails(complete: @escaping()->()) {
        WebService.shared.getTvShowDetails(id: tvID) { details, error in
            if error == nil, details != nil {
                self.details = details!
            }
            complete()
        }
    }
    
    func getTvShowSeasons(complete: @escaping()->()) {
        WebService.shared.getTvShowSeason(id: tvID, seasonNumber: seasonNumber) { seasons, error in
            if error == nil, seasons != nil {
                self.seasons = seasons!
            }
            complete()
        }
    }
    func getTvShowCasts(complete: @escaping()->()) {
        WebService.shared.getTvShowCasts(id: tvID) { casts, error in
            if error == nil, casts != nil {
                self.tvCasts = casts!
            }
            complete()
        }
    }
    
    
}
