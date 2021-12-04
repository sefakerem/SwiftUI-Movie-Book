//
//  ContentView.swift
//  MovieBook
//
//  Created by Sefa KEREM on 22.11.2021.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieViewModel:MovieViewModel
    @State var searchMovie = ""
    init(){
        self.movieViewModel = MovieViewModel()
        
    }
    var body: some View {
       
        NavigationView{
            VStack{
                TextField("Search Movie", text: $searchMovie) {
                    self.movieViewModel.movieSearch(search: searchMovie.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchMovie)
                }.padding().textFieldStyle(RoundedBorderTextFieldStyle())
                List(movieViewModel._movieList,id: \.imdbId){ movie in
                    NavigationLink(destination:MovieDetailView(
                        imdbID:movie.imdbId) , label: {
                        VStack{
                            AsyncImage(url: URL(string: movie.poster))
                            HStack{
                                Text(movie.tittle).font(.title).foregroundColor(.blue)
                                Text("-")
                                Text(movie.year).foregroundColor(.orange)
                            }
                        
                        }
                    })
                  
                }.navigationTitle(Text("Movie Book"))
            }
            
        }
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
