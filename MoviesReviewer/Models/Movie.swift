//
//  ReviewPageModel.swift
//  MoviesReviewer
//
//  Created by Timothey Urbanovich on 18/04/2022.
//

import Foundation

var movieName: String = ""
var APIKey: String = "k_rae8rk7s"
var searchLink: String = "https://imdb-api.com/en/API/SearchMovie/"
var APIRequest = searchLink + APIKey + "/" + movieName

struct MovieResponce: Decodable {
    
}

struct Movie: Decodable {
    
}
