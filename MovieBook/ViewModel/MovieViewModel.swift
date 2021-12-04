//
//  MovieViewModel.swift
//  MovieBook
//
//  Created by Sefa KEREM on 4.12.2021.
//

import Foundation
import SwiftUI
class MovieViewModel:ObservableObject{
    @Published var _movieList = [MovieModel]()
    let downloaderClient = DownloaderClient()
    func movieSearch(search:String){
        downloaderClient.getMovieSearch(search: search) { (sonuc) in
            switch sonuc{
            case.failure(let hata):
                print(hata)
            case.success(let listMovie):
                if let listMovie = listMovie{
                    DispatchQueue.main.async {
                        self._movieList =  listMovie.map(MovieModel.init)
                    }
                }
                
            }
        }
        
    }
}
struct MovieModel{
    let movie:Movie
    var tittle :String{
        movie.title
    }
    var poster:String{
        movie.poster
    }
    var year:String{
        movie.year
    }
    var imdbId:String{
        movie.imdbId
    }
    }
                            

