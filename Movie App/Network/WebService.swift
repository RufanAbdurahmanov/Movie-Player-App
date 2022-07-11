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
    func getSimiliarMovies(id: Int, complete: @escaping([SimiliarMoviesResult])->())
    func getPersonFilmography(id: Int, complete: @escaping([Cast])->())
    func getPerson(id: Int, complete: @escaping(Person)->())
    
    func getDiscoverMovies(genreID: Int, page: Int, complete: @escaping([DiscoverResult])->())
    func searchMovies(query: String, complete: @escaping([SearchResult])->())
    
    func getUpcomingMovies(page: Int, complete: @escaping([UpcomingMovieResult])->())
    
    func rateMovie(point: Float, movieID: Int, complete: @escaping((RatePostModel)->()))
    
    func getTvShowVideos(id: Int, complete: @escaping(([TvTrailerResult])->()))
    func getTvShowDetails(id: Int, complete: @escaping((TvDetails)->()))
    func getTvShowSeason(id: Int, seasonNumber: Int, complete: @escaping((TvSeasons)->()))
    func getTvShowCasts(id: Int, complete: @escaping(([TvCast])->()))
}

class WebService: WebServiceProtocol {
    static let shared = WebService()
    
    func getTrendingMovies(page: Int, complete: @escaping([TrendingMovieResult]) ->()) {
        let url = "\(baseURL.url.rawValue)\(Request.trending.path)\(MediaType.movie.type)\(TimeInterval.day.interval)?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: TrendingMovie.self, url: url) { response in
            complete(response.results ?? [])
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
            complete(response.results ?? [])
        }
    }
    
    func getTopRatedMovies(page: Int, complete: @escaping([TopRatedMovieResult]) ->()){
        let url = "\(baseURL.url.rawValue)/movie/top_rated?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: TopRatedMovies.self, url: url) { response in
            complete(response.results ?? [])
        }
    }
    
    func getTrendingTvs(page: Int, complete: @escaping ([TVResult]) -> ()) {
        let url = "\(baseURL.url.rawValue)\(Request.trending.path)\(MediaType.tv.type)\(TimeInterval.week.interval)?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: TV.self, url: url) { response in
            complete(response.results ?? [])
        }
    }
    
    func getAiringTvs(page: Int, complete: @escaping ([AiringResult]) -> ()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.tv.type)/airing_today?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: AiringTv.self, url: url) { response in
            complete(response.results ?? [])
        }
    }
    
    func getOntheAirTvs(page: Int, complete: @escaping ([OnTheAirResult]) -> ()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.tv.type)/on_the_air?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: OnTheAirTv.self, url: url) { response in
            complete(response.results ?? [])
        }
    }
    func getPopularTvs(page: Int, complete: @escaping ([PopularTvResult]) -> ()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.tv.type)/popular?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: PopularTv.self, url: url) { response in
            complete(response.results ?? [])
        }
    }
    func getTopRatedTvs(page: Int, complete: @escaping ([TopRatedTvResult]) -> ()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.tv.type)/top_rated?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: TopRatedTv.self, url: url) { response in
            complete(response.results ?? [])
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
            complete(response.results ?? [])
        }
    }
    
    func getMovieCasts(id: Int, complete: @escaping([MovieCast])->()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.movie.type)/\(id)/credits?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: MovieCasts.self, url: url) { response in
            complete(response.cast ?? [])
        }
    }
    
    func getSimiliarMovies(id: Int, complete: @escaping([SimiliarMoviesResult])->()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.movie.type)/\(id)/similar?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: SimiliarMovies.self, url: url) { response in
            complete(response.results ?? [])
        }
    }
    
    func getPerson(id: Int, complete: @escaping(Person)->()) {
        let url = "\(baseURL.url.rawValue)/person/\(id)?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: Person.self, url: url) { person in
            complete(person)
        }
    }
    
    func getPersonFilmography(id: Int, complete: @escaping([Cast])->()) {
        let url = "\(baseURL.url.rawValue)/person/\(id)/movie_credits?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: Filmography.self, url: url) { movies in
            complete(movies.cast ?? [])
        }
    }

    
    func getDiscoverMovies(genreID: Int, page: Int, complete: @escaping([DiscoverResult])->()){
        let url = "\(baseURL.url.rawValue)/discover/movie?api_key=\(apiKey.key.rawValue)&language=en-US&sort_by=popularity.desc&page=1&with_genres=\(genreID)"
        NetworkRequest.shared.requestAPI(type: DiscoverMovies.self, url: url) { response in
            complete(response.results ?? [])
        }
    }
    
    func searchMovies(query: String, complete: @escaping([SearchResult])->()){
        let url = "\(baseURL.url.rawValue)/search/movie?api_key=\(apiKey.key.rawValue)&query=\(query)&page=1&language=en-US"
        NetworkRequest.shared.requestAPI(type: SearchModel.self, url: url) { response in
            complete(response.results ?? [])
        }
    }
    
    func getUpcomingMovies(page: Int, complete: @escaping([UpcomingMovieResult])->()) {
        let url = "\(baseURL.url.rawValue)/movie/upcoming?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: UpcomingMovies.self, url: url) { response in
            complete(response.results ?? [])
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
    
    func getGenres(complete: @escaping([Genre])->()) {
        let url = "\(baseURL.url.rawValue)/genre/\(MediaType.movie.type)/list?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: Genres.self, url: url) { response in
            complete(response.genres ?? [])
        }
    }
    
    
    func getTvShowVideos(id: Int, complete: @escaping(([TvTrailerResult])->())) {
        let url = "\(baseURL.url.rawValue)/\(MediaType.tv.type)/\(id)/videos?api_key=\(apiKey.key.rawValue)&language=en-US"
        
        NetworkRequest.shared.requestAPI(type: TvTrailers.self, url: url) { trailers in
            complete(trailers.results ?? [])
        }
    }
    
    
    func getTvShowDetails(id: Int, complete: @escaping((TvDetails)->())) {
        let url = "\(baseURL.url.rawValue)/\(MediaType.tv.type)/\(id)?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: TvDetails.self, url: url) { details in
            complete(details)
        }
    }
    
    
    func getTvShowSeason(id: Int, seasonNumber: Int, complete: @escaping((TvSeasons)->())) {
        let url = "\(baseURL.url.rawValue)/\(MediaType.tv.type)/\(id)/season/\(seasonNumber)?api_key=\(apiKey.key.rawValue)&language=en-US"
        
        NetworkRequest.shared.requestAPI(type: TvSeasons.self, url: url) { seasons in
            complete(seasons)
        }
    }
    func getTvShowCasts(id: Int, complete: @escaping(([TvCast])->())) {
        let url = "\(baseURL.url.rawValue)/\(MediaType.tv.type)/\(id)/credits?api_key=\(apiKey.key.rawValue)&language=en-US"
        
        NetworkRequest.shared.requestAPI(type: TvCasts.self, url: url) { casts in
            complete(casts.cast ?? [])
        }
    }
}
