//
//  MovieDetails.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import Foundation

struct MovieDetails : Codable {

    let adult : Bool?
    let backdropPath : String?
    let budget : Int?
    let homepage : String?
    let id : Int?
    let imdbId : String?
    let originalLanguage : String?
    let originalTitle : String?
    let overview : String?
    let popularity : Float?
    let posterPath : String?
    let releaseDate : String?
    let revenue : Int?
    let runtime : Int?
    let status : String?
    let tagline : String?
    let title : String?
    let video : Bool?
    let voteAverage : Float?


    enum CodingKeys: String, CodingKey {
        case adult, budget, homepage, id, overview, popularity, revenue, runtime, tagline, title, status, video
        case backdropPath = "backdrop_path"
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
