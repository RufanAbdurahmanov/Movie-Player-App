//
//  WebService.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 31.05.22.
//

import Foundation

protocol WebServiceProtocol {
    func getTrendingMovies(page: Int, complete: @escaping([MovieResult])->())
    func getTrendingTVs(page: Int, complete: @escaping([TVResult])->())
    func getNowPlayingMovies(page: Int, complete: @escaping([NowPlayingResult])->())
    func getPopular(page: Int, complete: @escaping([PopularResult])->())
    func getTopRated(page: Int, complete: @escaping([TopRatedResult])->())
    func getDiscoverMovies(page: Int, complete: @escaping([DiscoverResult])->())
    func getUpcomingMovies(page: Int, complete: @escaping([UpcomingResult])->())
}

class WebService: WebServiceProtocol {
    static let shared = WebService()
    
    func getTrendingMovies(page: Int, complete: @escaping([MovieResult])->()) {
        let url = "\(baseURL.url.rawValue)\(Request.trending.path)\(MediaType.movie.type)\(TimeInterval.week.interval)?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: Movie.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    func getTrendingTVs(page: Int, complete: @escaping ([TVResult]) -> ()) {
        let url = "\(baseURL.url.rawValue)\(Request.trending.path)\(MediaType.tv.type)\(TimeInterval.week.interval)?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: TV.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    func getNowPlayingMovies(page: Int, complete: @escaping([NowPlayingResult])->()) {
        let url = "\(baseURL.url.rawValue)/movie/now_playing?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: NowPlayingMovies.self, url: url) { response in
            complete(response.results)
        }
    }
    
    func getPopular(page: Int, complete: @escaping([PopularResult])->()) {
        let url = "\(baseURL.url.rawValue)/movie/popular?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: PopularMovies.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    func getTopRated(page: Int, complete: @escaping([TopRatedResult])->()){
        let url = "\(baseURL.url.rawValue)/movie/top_rated?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: TopRatedMovies.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    func getDiscoverMovies(page: Int, complete: @escaping([DiscoverResult])->()){
        let url = "\(baseURL.url.rawValue)/discover/movie?api_key=\(apiKey.key.rawValue)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=true&page=1&with_watch_monetization_types=flatrate"
        NetworkRequest.shared.requestAPI(type: DiscoverMovies.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    
    func getUpcomingMovies(page: Int, complete: @escaping([UpcomingResult])->()) {
        let url = "\(baseURL.url.rawValue)/movie/upcoming?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: UpcomingMovies.self, url: url) { response in
            complete(response.results!)
        }
    }
    
}





