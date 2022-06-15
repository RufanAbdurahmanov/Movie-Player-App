//
//  TVShowsViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 09.06.22.
//

import Foundation

class TvShowsViewModel {
    
    var tvShows = [Items]()
    var tvShowItems = [CellItem]()
    
    
        func getTrendingTVs(complete: @escaping()->()) {
            tvShows.removeAll()
            WebService.shared.getTrendingTvs(page: 1) { [unowned self] tvs in
                for tv in tvs {
                    tvShowItems.append(CellItem(id: tv.id, title: tv.originalName, url: tv.backdropPath, voteAvarage: tv.voteAverage, releaseDate: tv.firstAirDate))
                }
                tvShows.append(Items(title: "Trending Tv Shows", cellItems: tvShowItems))
                tvShowItems.removeAll()
                complete()
            }
        }
    
    func getAiringTVs(complete: @escaping()->()) {
        WebService.shared.getAiringTvs(page: 1) { [unowned self] tvs in
            for tv in tvs {
                tvShowItems.append(CellItem(id: tv.id, title: tv.originalName, url: tv.backdropPath, voteAvarage: tv.voteAverage, releaseDate: tv.firstAirDate))
            }
            tvShows.append(Items(title: "Airing Tv Shows", cellItems: tvShowItems))
            tvShowItems.removeAll()
            complete()
        }
    }
    
    func getOnTheAirTVs(complete: @escaping()->()) {
        WebService.shared.getOntheAirTvs(page: 1) { [unowned self] tvs in
            for tv in tvs {
                tvShowItems.append(CellItem(id: tv.id, title: tv.originalName, url: tv.backdropPath, voteAvarage: tv.voteAverage, releaseDate: tv.firstAirDate))
            }
            tvShows.append(Items(title: "On the Air Tv Shows", cellItems: tvShowItems))
            tvShowItems.removeAll()
            complete()
        }
    }
    
    func getPopularTVs(complete: @escaping()->()) {
        WebService.shared.getPopularTvs(page: 1) { [unowned self] tvs in
            for tv in tvs {
                tvShowItems.append(CellItem(id: tv.id, title: tv.originalName, url: tv.backdropPath, voteAvarage: tv.voteAverage, releaseDate: tv.firstAirDate))
            }
            tvShows.append(Items(title: "Popular Tv Shows", cellItems: tvShowItems))
            tvShowItems.removeAll()
            complete()
        }
    }
    
    func getTopRatedTVs(complete: @escaping()->()) {
        WebService.shared.getTopRatedTvs(page: 1) { [unowned self] tvs in
            for tv in tvs {
                tvShowItems.append(CellItem(id: tv.id, title: tv.originalName, url: tv.backdropPath, voteAvarage: tv.voteAverage, releaseDate: tv.firstAirDate))
            }
            tvShows.append(Items(title: "Top-Rated Tv Shows", cellItems: tvShowItems))
            tvShowItems.removeAll()
            complete()
        }
    }
    
    
}
