//
//  ReviewPageModel.swift
//  MoviesReviewer
//
//  Created by Timothey Urbanovich on 18/04/2022.
//

import UIKit
import Foundation

var movieName: String = "inception 2010"
var APIKey: String = "k_rae8rk7s"
var searchLink: String = "https://imdb-api.com/en/API/SearchMovie/"
var APIRequest = searchLink + APIKey + "/" + movieName
var apiURL = URL(string: APIRequest)

struct MovieResponce: Decodable {
    
}

struct Response: Codable {
    var searchType: String = ""
    var expression: String = ""
    var results: [Results] = []
    var errorMessage: String = ""
}

struct Results: Codable {
    var id: String = ""
    var resultType: String = ""
    var image: String = ""
    var title: String = ""
    var description: String = ""
}

/*
 {"searchType":"Movie","expression":"inception 2010","results":[{"id":"tt1375666","resultType":"Title","image":"https://imdb-api.com/images/original/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_Ratio0.6800_AL_.jpg","title":"Inception","description":"(2010)"},{"id":"tt1790736","resultType":"Title","image":"https://imdb-api.com/images/original/MV5BMjE0NGIwM2EtZjQxZi00ZTE5LWExN2MtNDBlMjY1ZmZkYjU3XkEyXkFqcGdeQXVyNjMwNzk3Mjk@._V1_Ratio0.6800_AL_.jpg","title":"Inception: Motion Comics","description":"(2010 Video)"},{"id":"tt5295990","resultType":"Title","image":"https://imdb-api.com/images/original/MV5BZGFjOTRiYjgtYjEzMS00ZjQ2LTkzY2YtOGQ0NDI2NTVjOGFmXkEyXkFqcGdeQXVyNDQ5MDYzMTk@._V1_Ratio0.6800_AL_.jpg","title":"Inception: Jump Right Into the Action","description":"(2010 Video)"},{"id":"tt12960252","resultType":"Title","image":"https://imdb-api.com/images/original/nopicture.jpg","title":"Inception Premiere","description":"(2010)"},{"id":"tt1686778","resultType":"Title","image":"https://imdb-api.com/images/original/nopicture.jpg","title":"Inception: 4Movie Premiere Special","description":"(2010 TV Movie)"}],"errorMessage":""}
 */
