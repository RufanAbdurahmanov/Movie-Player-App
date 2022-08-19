//
//  WebService.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 31.05.22.
//

import Foundation
import Alamofire

protocol WebServiceProtocol {
    func getTrendingMovies(page: Int, complete: @escaping(([TrendingMovieResult]?, Error?)->()))
    func getNowPlayingMovies(page: Int, complete: @escaping([NowPlayingMovieResult]?, Error?)->())
    func getPopularMovies(page: Int, complete: @escaping([PopularMovieResult]?, Error?)->())
    func getTopRatedMovies(page: Int, complete: @escaping([TopRatedMovieResult]?, Error?)->())
    
    func getTrendingTvs(page: Int, complete: @escaping([TVResult]?, Error?)->())
    func getAiringTvs(page: Int, complete: @escaping ([AiringResult]?, Error?)->())
    func getOntheAirTvs(page: Int, complete: @escaping ([OnTheAirResult]?, Error?)->())
    func getPopularTvs(page: Int, complete: @escaping ([PopularTvResult]?, Error?)->())
    func getTopRatedTvs(page: Int, complete: @escaping ([TopRatedTvResult]?, Error?)->())
    
    func getMovieDetails(id: Int, complete: @escaping(MovieDetails?, Error?)->())
    func getMovieVideos(id: String, complete: @escaping([VideoResult]?, Error?)->())
    func getMovieCasts(id: Int, complete: @escaping([MovieCast]?, Error?)->())
    func getSimiliarMovies(id: Int, complete: @escaping([SimiliarMoviesResult]?, Error?)->())
    func getPersonFilmography(id: Int, complete: @escaping([Cast]?, Error?)->())
    func getPerson(id: Int, complete: @escaping(Person?, Error?)->())
    
    func getDiscoverMovies(genreID: Int, page: Int, complete: @escaping([DiscoverResult]?, Error?)->())
    func searchMovies(query: String, complete: @escaping([SearchResult]?, Error?)->())
    
    func getUpcomingMovies(page: Int, complete: @escaping([UpcomingMovieResult]?, Error?)->())
    
    func rateMovie(point: Float, movieID: Int, complete: @escaping((RatePostModel?, Error?)->()))
    
    func getTvShowVideos(id: Int, complete: @escaping(([TvTrailerResult]?, Error?)->()))
    func getTvShowDetails(id: Int, complete: @escaping((TvDetails?, Error?)->()))
    func getTvShowSeason(id: Int, seasonNumber: Int, complete: @escaping((TvSeasons?, Error?)->()))
    func getTvShowCasts(id: Int, complete: @escaping(([TvCast]?, Error?)->()))
}

class WebService: WebServiceProtocol {
    static let shared = WebService()
    
    func getTrendingMovies(page: Int, complete: @escaping(([TrendingMovieResult]?, Error?)->())) {
        let url = "\(baseURL.url.rawValue)\(Request.trending.path)\(MediaType.movie.type)\(TimeInterval.day.interval)?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: TrendingMovie.self, url: url) { movies, error in
            if error == nil, movies != nil {
                complete(movies?.results, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    
    
    func getNowPlayingMovies(page: Int, complete: @escaping([NowPlayingMovieResult]?, Error?) ->()) {
        let url = "\(baseURL.url.rawValue)/movie/now_playing?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: NowPlayingMovies.self, url: url) { movies, error in
            if error == nil, movies != nil {
                complete(movies?.results, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    func getPopularMovies(page: Int, complete: @escaping([PopularMovieResult]?, Error?) ->()) {
        let url = "\(baseURL.url.rawValue)/movie/popular?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: PopularMovies.self, url: url) { movies, error in
            if error == nil, movies != nil {
                complete(movies?.results, nil)
            } else {
                complete(nil, error)
            }
        }
    }
    
    func getTopRatedMovies(page: Int, complete: @escaping([TopRatedMovieResult]?, Error?) ->()){
        let url = "\(baseURL.url.rawValue)/movie/top_rated?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        
        NetworkRequest.shared.requestAPI(type: TopRatedMovies.self, url: url) { movies, error in
            if error == nil, movies != nil {
                complete(movies?.results, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    func getTrendingTvs(page: Int, complete: @escaping ([TVResult]?, Error?) -> ()) {
        let url = "\(baseURL.url.rawValue)\(Request.trending.path)\(MediaType.tv.type)\(TimeInterval.week.interval)?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: TV.self, url: url) { tvs, error in
            if error == nil, tvs != nil {
                complete(tvs?.results, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    func getAiringTvs(page: Int, complete: @escaping ([AiringResult]?, Error?) -> ()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.tv.type)/airing_today?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: AiringTv.self, url: url) { tvs, error in
            if error == nil, tvs != nil {
                complete(tvs?.results, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    func getOntheAirTvs(page: Int, complete: @escaping ([OnTheAirResult]?, Error?) -> ()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.tv.type)/on_the_air?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: OnTheAirTv.self, url: url) { tvs, error in
            if error == nil, tvs != nil {
                complete(tvs?.results, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    func getPopularTvs(page: Int, complete: @escaping ([PopularTvResult]?, Error?) -> ()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.tv.type)/popular?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: PopularTv.self, url: url) { tvs, error in
            if error == nil, tvs != nil {
                complete(tvs?.results, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    func getTopRatedTvs(page: Int, complete: @escaping ([TopRatedTvResult]?, Error?) -> ()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.tv.type)/top_rated?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: TopRatedTv.self, url: url) { tvs, error in
            if error == nil, tvs != nil {
                complete(tvs?.results, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    func getMovieDetails(id: Int, complete: @escaping(MovieDetails?, Error?) ->()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.movie.type)/\(id)?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: MovieDetails.self, url: url) { details, error in
            if error == nil, details != nil {
                complete(details, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    func getMovieVideos(id: String, complete: @escaping([VideoResult]?, Error?) ->()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.movie.type)/\(id)/videos?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: VideoDetails.self, url: url) { videos, error in
            if error == nil, videos != nil {
                complete(videos?.results, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    func getMovieCasts(id: Int, complete: @escaping([MovieCast]?, Error?)->()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.movie.type)/\(id)/credits?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: MovieCasts.self, url: url) { casts, error in
            if error == nil, casts != nil {
                complete(casts?.cast, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    func getSimiliarMovies(id: Int, complete: @escaping([SimiliarMoviesResult]?, Error?)->()) {
        let url = "\(baseURL.url.rawValue)\(MediaType.movie.type)/\(id)/similar?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: SimiliarMovies.self, url: url) { movies, error in
            if error == nil, movies != nil {
                complete(movies?.results, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    func getPerson(id: Int, complete: @escaping(Person?, Error?)->()) {
        let url = "\(baseURL.url.rawValue)/person/\(id)?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: Person.self, url: url) { person, error in
            if error == nil, person != nil {
                complete(person, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    func getPersonFilmography(id: Int, complete: @escaping([Cast]?, Error?)->()) {
        let url = "\(baseURL.url.rawValue)/person/\(id)/movie_credits?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: Filmography.self, url: url) { casts, error in
            if error == nil, casts != nil {
                complete(casts?.cast, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    
    func getDiscoverMovies(genreID: Int, page: Int, complete: @escaping([DiscoverResult]?, Error?)->()){
        let url = "\(baseURL.url.rawValue)/discover/movie?api_key=\(apiKey.key.rawValue)&language=en-US&sort_by=popularity.desc&page=1&with_genres=\(genreID)"
        NetworkRequest.shared.requestAPI(type: DiscoverMovies.self, url: url) { movies, error in
            if error == nil, movies != nil {
                complete(movies?.results, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    func searchMovies(query: String, complete: @escaping([SearchResult]?, Error?)->()){
        let url = "\(baseURL.url.rawValue)/search/movie?api_key=\(apiKey.key.rawValue)&query=\(query)&page=1&language=en-US"
        NetworkRequest.shared.requestAPI(type: SearchModel.self, url: url) { movies, error in
            if error == nil, movies != nil {
                complete(movies?.results, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    func getUpcomingMovies(page: Int, complete: @escaping([UpcomingMovieResult]?, Error?)->()) {
        let url = "\(baseURL.url.rawValue)/movie/upcoming?api_key=\(apiKey.key.rawValue)&language=en-US&page=\(page)"
        NetworkRequest.shared.requestAPI(type: UpcomingMovies.self, url: url) { movies, error in
            if error == nil, movies != nil {
                complete(movies?.results, nil)
            } else {
                complete(nil, error!)
            }
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
    
    func rateMovie(point: Float, movieID: Int, complete: @escaping((RatePostModel?, Error?)->())) {
        let url = "\(baseURL.url.rawValue)/\(MediaType.movie.type)/\(movieID)/rating?api_key=\(apiKey.key.rawValue)"
        NetworkRequest.shared.requestAPI(type: RatePostModel.self, method: .post, url: url, params: ["value": point]) { response, error in
            if error == nil, response != nil {
                complete(response, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    func getGenres(complete: @escaping([Genre]?, Error?)->()) {
        let url = "\(baseURL.url.rawValue)/genre/\(MediaType.movie.type)/list?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: Genres.self, url: url) { genres, error in
            if error == nil, genres != nil {
                complete(genres?.genres, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    
    func getTvShowVideos(id: Int, complete: @escaping(([TvTrailerResult]?, Error?)->())) {
        let url = "\(baseURL.url.rawValue)/\(MediaType.tv.type)/\(id)/videos?api_key=\(apiKey.key.rawValue)&language=en-US"
        
        NetworkRequest.shared.requestAPI(type: TvTrailers.self, url: url) { tvs, error in
            if error == nil, tvs != nil {
                complete(tvs?.results, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    
    func getTvShowDetails(id: Int, complete: @escaping((TvDetails?, Error?)->())) {
        let url = "\(baseURL.url.rawValue)/\(MediaType.tv.type)/\(id)?api_key=\(apiKey.key.rawValue)&language=en-US"
        NetworkRequest.shared.requestAPI(type: TvDetails.self, url: url) { details, error in
            if error == nil, details != nil {
                complete(details, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    
    
    func getTvShowSeason(id: Int, seasonNumber: Int, complete: @escaping((TvSeasons?, Error?)->())) {
        let url = "\(baseURL.url.rawValue)/\(MediaType.tv.type)/\(id)/season/\(seasonNumber)?api_key=\(apiKey.key.rawValue)&language=en-US"
        
        NetworkRequest.shared.requestAPI(type: TvSeasons.self, url: url) { seasons, error in
            if error == nil, seasons != nil {
                complete(seasons, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
    func getTvShowCasts(id: Int, complete: @escaping(([TvCast]?, Error?)->())) {
        let url = "\(baseURL.url.rawValue)/\(MediaType.tv.type)/\(id)/credits?api_key=\(apiKey.key.rawValue)&language=en-US"
        
        NetworkRequest.shared.requestAPI(type: TvCasts.self, url: url) { casts, error in
            if error == nil, casts != nil {
                complete(casts?.cast, nil)
            } else {
                complete(nil, error!)
            }
        }
    }
}
