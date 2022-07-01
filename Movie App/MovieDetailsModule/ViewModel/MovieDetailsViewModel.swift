//
//  MovieDetailsViewModel.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 08.06.22.
//

import Foundation
import UIKit

class MovieDetailsViewModel {
    
    var movieDetails: MovieDetails?
    var movieCasts = [MovieCast]()
    var similarMovies = [SimiliarMoviesResult]()
    var movieName: String!
    fileprivate let mainQueue = OperationQueue.main
    
    var id: Int!
    
    init() {}
    
    init(id: Int, name: String) {
        self.id = id
        self.movieName = name
    }
    
    func getMovieDetails(complete: @escaping()->()) {
        WebService.shared.getMovieDetails(id: id) { [unowned self] details in
            self.movieDetails = details
            complete()
        }
    }
    
    func getCasts(complete: @escaping()->()) {
        WebService.shared.getMovieCasts(id: id) { casts in
            self.movieCasts = casts
            complete()
        }
    }
    
    func getSilimiarMovies(complete: @escaping()->()) {
        WebService.shared.getSimiliarMovies(id: id) { movies in
            self.similarMovies = movies
            complete()
        }
    }
    
    func downloadTrailer(item: VideoResult, cancelDownload: Bool, complete: @escaping(String?, Double?)->()) {
        
        if cancelDownload == true {
            mainQueue.cancelAllOperations()
            complete(nil, 0)
        } else {
            mainQueue.addOperation {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    
                    WebService.shared.downloadVideo(urlString: "https://youtu.be/zAGVQLHvwOY") { [unowned self] progress, url in
                        
                        if progress == 1, let url = url, cancelDownload == false {
                            CoreDataHelper.shared.insertDownloadTrailersData(movieName: movieName, trailerName:  item.name ?? "trailer x", trailerPath: "\(url)")
                            complete(nil, progress)
                        } else if progress < 1, cancelDownload == false {
                            complete(nil, progress)
                        } else if progress == 0 {
                            complete(nil, progress)
                        } else {
                            complete("Error", 0)
                        }
                    }
//                }
            }
        }
    }
    
    func rateMovie(point: Float, complete: @escaping(RatePostModel)->()) {
        WebService.shared.rateMovie(point: point, movieID: id) { response in
            complete(response)
        }
    }
    
}
