
//
//  HomeViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 31.05.22.
//

import Foundation

class HomeViewModel {
    var movies = [Movies]()
    var movieItems = [MovieItem]()
    
    func getDatas(complete: @escaping()->()) {
        defer {
            complete()
        }
        getMovieList()
        getTVList()
    }
    func getMovieList() {
        WebService.shared.getTrendingMovies(page: 1) { [unowned self] trendingMovies in
            for movie in trendingMovies {
                movieItems.append(MovieItem(title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
            }
            movies.append(Movies(title: "Trending movies", movieItems: movieItems))
            movieItems.removeAll()
        }
    }
    func getTVList() {
        WebService.shared.getTrendingTVs(page: 1) { [unowned self] tvs in
            for tv in tvs {
                movieItems.append(MovieItem(title: tv.originalName, url: tv.backdropPath, voteAvarage: tv.voteAverage, releaseDate: tv.firstAirDate))
            }
            movies.append(Movies(title: "Trending TVs", movieItems: movieItems))
            movieItems.removeAll()
        }
    }
    
    
    
    
    
    func getMovies(complete: @escaping()->()) {
        WebService.shared.getTrendingMovies(page: 1) { [unowned self] trendingMovies in
            for movie in trendingMovies {
                movieItems.append(MovieItem(title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
            }
            movies.append(Movies(title: "Trending movies", movieItems: movieItems))
            movieItems.removeAll()
            complete()
        }
    }
    
    func getTVs(complete: @escaping()->()) {
        WebService.shared.getTrendingTVs(page: 1) { [unowned self] tvs in
            for tv in tvs {
                movieItems.append(MovieItem(title: tv.originalName, url: tv.backdropPath, voteAvarage: tv.voteAverage, releaseDate: tv.firstAirDate))
            }
            movies.append(Movies(title: "Trending TVs", movieItems: movieItems))
            movieItems.removeAll()
            complete()
        }
    }
    
    func getNowPlayingMovies(complete: @escaping()->()) {
        WebService.shared.getNowPlayingMovies(page: 1) { [unowned self] nowPlayingMovies in
            for movie in nowPlayingMovies {
                movieItems.append(MovieItem(title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
            }
            movies.append(Movies(title: "Now-playing movies", movieItems: movieItems))
            movieItems.removeAll()
            complete()
        }
    }
    
    func getPopularMovies(complete: @escaping()->()) {
        WebService.shared.getPopular(page: 1) { [unowned self] popularMovies in
            for movie in popularMovies {
                movieItems.append(MovieItem(title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
            }
            movies.append(Movies(title: "Popular movies", movieItems: movieItems))
            movieItems.removeAll()
            complete()
        }
    }
    
    func getTopRatedMovies(complete: @escaping()->()) {
        WebService.shared.getTopRated(page: 1) { [unowned self] topRatedMovies in
            for movie in topRatedMovies {
                movieItems.append(MovieItem(title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
            }
            movies.append(Movies(title: "Top-rated movies", movieItems: movieItems))
            movieItems.removeAll()
            
            complete()
        }
    }
    
    func getDiscoverMovies(complete: @escaping()->()) {
        WebService.shared.getDiscoverMovies(page: 1) { [unowned self] discoverMovies in
            for movie in discoverMovies {
                movieItems.append(MovieItem(title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
            }
            movies.append(Movies(title: "Discover movies", movieItems: movieItems))
            movieItems.removeAll()
            complete()
        }
    }
}
