//
//  ReviewPageModel.swift
//  MoviesReviewer
//
//  Created by Timothey Urbanovich on 18/04/2022.
//

import UIKit
import Foundation

var movieName: String = ""

struct MovieResults: Decodable {
    let Search: [Movie]
}

struct Movie: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let _Type: String
    let Poster: String?
    
    private enum CodingKeys: String, CodingKey {
        case Title, Year, imdbID, _Type = "Type", Poster
    }
}
