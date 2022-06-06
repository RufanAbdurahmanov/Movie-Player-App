//
//  WebServiceManager.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 31.05.22.
//


private enum EndPoint: String {
    case trending = "/trending"
    case movie = "/movie"
    case search = "/search/company"
}

enum baseURL: String {
case url = "https://api.themoviedb.org/3"
}

enum apiKey: String {
    case key = "8eaf550eb078f0aa5270046aabe06fd6"
}

enum Request {
    case trending
    case movie
    case search
    
    var path: String {
        switch self {
        case .trending:
            return EndPoint.trending.rawValue
        case .movie:
            return EndPoint.movie.rawValue
        case .search:
            return EndPoint.search.rawValue
        }
    }
}

private enum Interval: String {
    case day = "/day"
    case week = "/week"
}

enum TimeInterval {
    case day
    case week
    
    var interval: String {
        switch self {
        case .day:
            return Interval.day.rawValue
        case .week:
            return Interval.week.rawValue
        }
    }
}


private enum Media: String {
    case movie = "/movie"
    case tv = "/tv"
    case person = "/person"
    
}

enum MediaType {
    case movie
    case tv
    case person
    
    var type: String {
        switch self {
        case .movie:
            return Media.movie.rawValue
        case .tv:
            return Media.tv.rawValue
        case .person:
            return Media.person.rawValue
        }
    }
}
