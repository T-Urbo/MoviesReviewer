//
//  MovieServices.swift
//  MoviesReviewer
//
//  Created by Timothey Urbanovich on 18/04/2022.
//

import Foundation

protocol MovieService {
    
}

enum MovieListEndpoint: String {
    case movieNowPlaying = "movie_now_playing"
    case movieUpcoming = "movie_upcoming"
    case movieTopRated = "movie_top_rated"
    case moviePopular = "movie_popular"
    
    var description: String {
        switch self {
        case .movieNowPlaying:
            return "Now Playing"
        case .movieUpcoming:
            return "Upcoming"
        case .movieTopRated:
            return "Top Rated"
        case .moviePopular:
            return "Popular"
        }
    }
}

enum MovieError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescriptionKey: String {
        switch self {
        case .apiError: return "API Fetching error"
        case .invalidEndpoint: return "Invalid endpoint error"
        case .invalidResponse: return "Invalid responce error"
        case .noData: return "Data Lack error"
        case .serializationError: return "Data decoding error"
        }
    }
    
    var errorUserInfo: [String: Any] {
        [NSLocalizedDescriptionKey: localizedDescriptionKey]
    }
}
