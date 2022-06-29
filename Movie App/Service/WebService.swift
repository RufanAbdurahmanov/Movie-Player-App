//
//  WebService.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 31.05.22.
//

import Foundation
import Alamofire

protocol WebServiceProtocol {
    func getTrendingMovies(page: Int, complete: @escaping([TrendingMovieResult])->())
    func getNowPlayingMovies(page: Int, complete: @escaping([NowPlayingMovieResult])->())
    func getPopularMovies(page: Int, complete: @escaping([PopularMovieResult])->())
    func getTopRatedMovies(page: Int, complete: @escaping([TopRatedMovieResult])->())
    
    func getTrendingTvs(page: Int, complete: @escaping([TVResult])->())
    func getAiringTvs(page: Int, complete: @escaping ([AiringResult])->())
    func getOntheAirTvs(page: Int, complete: @escaping ([OnTheAirResult])->())
    func getPopularTvs(page: Int, complete: @escaping ([PopularTvResult])->())
    func getTopRatedTvs(page: Int, complete: @escaping ([TopRatedTvResult])->())
    
    func getMovieDetails(id: Int, complete: @escaping(MovieDetails)->())
    func getMovieVideos(id: String, complete: @escaping([VideoResult])->())
    func getMovieCasts(id: Int, complete: @escaping([MovieCast])->())
    func getPerson(id: Int, complete: @escaping(Person)->())
    
    func getDiscoverMovies(page: Int, complete: @escaping([DiscoverResult])->())
    
    func getUpcomingMovies(page: Int, complete: @escaping([UpcomingMovieResult])->())
    
    func rateMovie(point: Float, movieID: Int, complete: @escaping((RatePostModel)->()))
}

class WebService: WebServiceProtocol {
    static let shared = WebService()
    
    func getTrendingMovies(page: Int, complete: @escaping([TrendingMovieResult]) ->()) {
        let url = "\(baseURL.url.rawValue)\(Request.trending.path)\(MediaType.movie.type)\(TimeInterval.day.interval)?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: TrendingMovie.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    func getNowPlayingMovies(page: Int, complete: @escaping([NowPlayingMovieResult]) ->()) {
        let url = "\(baseURL.url.rawValue)/movie/now_playing?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: NowPlayingMovies.self, url: url) { response in
            complete(response.results)
        }
    }
    
    func getPopularMovies(page: Int, complete: @escaping([PopularMovieResult]) ->()) {
        let url = "\(baseURL.url.rawValue)/movie/popular?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: PopularMovies.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    func getTopRatedMovies(page: Int, complete: @escaping([TopRatedMovieResult]) ->()){
        let url = "\(baseURL.url.rawValue)/movie/top_rated?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: TopRatedMovies.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    func getTrendingTvs(page: Int, complete: @escaping ([TVResult]) -> ()) {
        let url = "\(baseURL.url.rawValue)\(Request.trending.path)\(MediaType.tv.type)\(TimeInterval.week.interval)?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: TV.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    func getAiringTvs(page: Int, complete: @escaping ([AiringResult]) -> ()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.tv.type)/airing_today?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: AiringTv.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    func getOntheAirTvs(page: Int, complete: @escaping ([OnTheAirResult]) -> ()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.tv.type)/on_the_air?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: OnTheAirTv.self, url: url) { response in
            complete(response.results!)
        }
    }
    func getPopularTvs(page: Int, complete: @escaping ([PopularTvResult]) -> ()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.tv.type)/popular?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: PopularTv.self, url: url) { response in
            complete(response.results!)
        }
    }
    func getTopRatedTvs(page: Int, complete: @escaping ([TopRatedTvResult]) -> ()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.tv.type)/top_rated?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: TopRatedTv.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    func getMovieDetails(id: Int, complete: @escaping(MovieDetails) ->()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.movie.type)/\(id)?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: MovieDetails.self, url: url) { response in
            complete(response)
        }
    }
    
    func getMovieVideos(id: String, complete: @escaping([VideoResult]) ->()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.movie.type)/\(id)/videos?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: VideoDetails.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    func getMovieCasts(id: Int, complete: @escaping([MovieCast])->()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.movie.type)/\(id)/credits?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: MovieCasts.self, url: url) { response in
            complete(response.cast!)
        }
    }
    
    func getPerson(id: Int, complete: @escaping(Person)->()) {
        let url = "\(baseURL.url.rawValue)/person/\(id)?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: Person.self, url: url) { person in
            complete(person)
        }
    }
    
    func getDiscoverMovies(page: Int, complete: @escaping([DiscoverResult])->()){
        let url = "\(baseURL.url.rawValue)/discover/movie?api_key=\(apiKey.key.rawValue)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=true&page=1&with_watch_monetization_types=flatrate"
        NetworkRequest.shared.requestAPI(type: DiscoverMovies.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    
    func getUpcomingMovies(page: Int, complete: @escaping([UpcomingMovieResult])->()) {
        let url = "\(baseURL.url.rawValue)/movie/upcoming?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: UpcomingMovies.self, url: url) { response in
            complete(response.results!)
        }
    }
    
    
    func downloadVideo(urlString: String, completion: @escaping(Double, URL?)->()) {
        
        let url = URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        //let url = URL(string: "https://www.youtube.com/watch?v=VS_ub1QaIYQ")
        
        let request = AF.request(url!).downloadProgress(closure: {
            (progress) in
            let pro = progress.fractionCompleted
                completion(pro, nil)
        })
        
            request.responseData { response in
                if let data = response.data {
                    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                    let videoURL = documentsURL.appendingPathComponent("video.mp4")
                    do {
                        try data.write(to: videoURL, options: .fileProtectionMask)
                            completion(1, videoURL)
                    } catch {
                        print("Something went wrong!")
                    }
                }
            }
    }
    
    func rateMovie(point: Float, movieID: Int, complete: @escaping((RatePostModel)->())) {
        let url = "\(baseURL.url.rawValue)/\(MediaType.movie.type)/\(movieID)/rating?api_key=\(apiKey.key.rawValue)"
        NetworkRequest.shared.requestAPI(type: RatePostModel.self, method: .post, url: url, params: ["value": point]) { response in
            complete(response)
        }
    }
}
