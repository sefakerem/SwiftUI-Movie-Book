//
//  DownloaderClient.swift
//  MovieBook
//
//  Created by Sefa KEREM on 4.12.2021.
//

import Foundation
import SwiftUI
class DownloaderClient {
    
    
    func getMovieSearch(search: String, completion: @escaping (Result<[Movie]?,DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=fc4e2f2d") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.datadidnotcome))
            }
            
            guard let responseMovie = try? JSONDecoder().decode(GetMovie.self, from: data) else {
                return completion(.failure(.DataProcessingFailed))
            }
            
            completion(.success(responseMovie.movies))
            
        }.resume()
        
    }
    func getMovieId(id:String,completion:@escaping (Result<MovieDetail?,DownloaderError>) -> Void){
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(id)&apikey=fc4e2f2d") else {
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.datadidnotcome))
            }
            
            guard let responseMovieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.DataProcessingFailed))
            }
            
            completion(.success(responseMovieDetail.self))
            
        }.resume()
    }
    
  
    
    
}

enum DownloaderError: Error {
    case wrongUrl
    case datadidnotcome
    case DataProcessingFailed
}
