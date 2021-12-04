//
//  MovieDetailView.swift
//  MovieBook
//
//  Created by Sefa KEREM on 4.12.2021.
//

import SwiftUI

struct MovieDetailView: View {
    let imdbID:String
    
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: movieDetailViewModel.movieDetail?.poster ?? "data:image/png;base64,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" ))
            HStack{
                Text(movieDetailViewModel.movieDetail?.title ?? "Loading..")
                Text("-").padding().frame(alignment: .center)
                Text(movieDetailViewModel.movieDetail?.year
                     ?? "Loading..").padding().frame(alignment:.center)
            }
            HStack{
                Text("Director: ")
                Text(movieDetailViewModel.movieDetail?.director ?? "Loading..")
            }
            Text(movieDetailViewModel.movieDetail?.plot ?? "Loading..")
            
        }.onAppear(perform: {
            self.movieDetailViewModel.movieDetailId(imdbId: imdbID)
        })
                
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(imdbID: "test")
    }
}
