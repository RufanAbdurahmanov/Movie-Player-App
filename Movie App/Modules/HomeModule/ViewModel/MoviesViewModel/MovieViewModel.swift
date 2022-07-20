
//
//  MovieViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 31.05.22.
//

import Foundation

class MovieViewModel {
    var movies = [Items]()
    var movieItems = [CellItem]()
    
    
    func getMovies(complete: @escaping()->()) {
        movies.removeAll()
        WebService.shared.getTrendingMovies(page: 1) { [unowned self] trendingMovies, error in
            if error == nil, trendingMovies != nil {
                for movie in trendingMovies! {
                    movieItems.append(CellItem(id: movie.id, title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
                }
                movies.append(Items(title: "Daily Trending Movies", cellItems: movieItems))
                movieItems.removeAll()
            }
            complete()
        }
    }
    

    
    func getNowPlayingMovies(complete: @escaping()->()) {
        WebService.shared.getNowPlayingMovies(page: 1) { [unowned self] nowPlayingMovies, error in
            if error == nil, nowPlayingMovies != nil {
                for movie in nowPlayingMovies! {
                    movieItems.append(CellItem(id: movie.id, title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
                }
                movies.append(Items(title: "Now-Playing Movies", cellItems: movieItems))
                movieItems.removeAll()
            }
            complete()
        }
    }
    
    func getPopularMovies(complete: @escaping()->()) {
        WebService.shared.getPopularMovies(page: 1) { [unowned self] popularMovies, error in
            if error == nil, popularMovies != nil {
                for movie in popularMovies! {
                    movieItems.append(CellItem(id: movie.id, title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
                }
                movies.append(Items(title: "Popular Movies", cellItems: movieItems))
                movieItems.removeAll()
            }
            complete()
        }
    }
    
    func getTopRatedMovies(complete: @escaping()->()) {
        WebService.shared.getTopRatedMovies(page: 1) { [unowned self] topRatedMovies, error in
            if error == nil, topRatedMovies != nil {
                for movie in topRatedMovies! {
                    movieItems.append(CellItem(id: movie.id, title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
                }
                movies.append(Items(title: "Top-Rated Movies", cellItems: movieItems))
                movieItems.removeAll()
            }
            complete()
        }
    }
    
}
