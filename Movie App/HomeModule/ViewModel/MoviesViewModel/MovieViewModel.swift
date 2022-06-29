
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
        WebService.shared.getTrendingMovies(page: 1) { [unowned self] trendingMovies in
            for movie in trendingMovies {
                movieItems.append(CellItem(id: movie.id, title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
            }
            movies.append(Items(title: "Daily Trending Movies", cellItems: movieItems))
            movieItems.removeAll()
            complete()
        }
    }
    

    
    func getNowPlayingMovies(complete: @escaping()->()) {
        WebService.shared.getNowPlayingMovies(page: 1) { [unowned self] nowPlayingMovies in
            for movie in nowPlayingMovies {
                movieItems.append(CellItem(id: movie.id, title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
            }
            movies.append(Items(title: "Now-Playing Movies", cellItems: movieItems))
            movieItems.removeAll()
            complete()
        }
    }
    
    func getPopularMovies(complete: @escaping()->()) {
        WebService.shared.getPopularMovies(page: 1) { [unowned self] popularMovies in
            for movie in popularMovies {
                movieItems.append(CellItem(id: movie.id, title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
            }
            movies.append(Items(title: "Popular Movies", cellItems: movieItems))
            movieItems.removeAll()
            complete()
        }
    }
    
    func getTopRatedMovies(complete: @escaping()->()) {
        WebService.shared.getTopRatedMovies(page: 1) { [unowned self] topRatedMovies in
            for movie in topRatedMovies {
                movieItems.append(CellItem(id: movie.id, title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
            }
            movies.append(Items(title: "Top-Rated Movies", cellItems: movieItems))
            movieItems.removeAll()
            complete()
        }
    }
    
//    func getDiscoverMovies(complete: @escaping()->()) {
//        WebService.shared.getDiscoverMovies(page: 1) { [unowned self] discoverMovies in
//            for movie in discoverMovies {
//                movieItems.append(MovieItem(id: movie.id, title: movie.originalTitle, url: movie.backdropPath, voteAvarage: movie.voteAverage, releaseDate: movie.releaseDate))
//            }
//            movies.append(Movies(title: "Discover movies", movieItems: movieItems))
//            movieItems.removeAll()
//            complete()
//        }
//    }
}
