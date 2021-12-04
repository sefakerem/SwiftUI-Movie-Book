//
//  Movie.swift
//  MovieBook
//
//  Created by Sefa KEREM on 22.11.2021.
//

import Foundation

struct Movie:Codable{
    let title :String
    let year:String
    let imdbId:String
    let type:String
    let poster :String
    private enum CodingKeys:String,CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
   
}
struct GetMovie:Decodable{
    let movies :[Movie]
    private enum CodingKeys:String, CodingKey{
        case movies = "Search"
        
    }
     
}
