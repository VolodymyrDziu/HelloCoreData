//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Volodymyr Dziubenko on 21.03.2025.
//

import SwiftUI

struct ContentView: View {
    
        let coreDM: CoreDataManager
    
        @State var movieTitle: String = ""
    
        @State private var movies: [Movie] = [Movie]()
    
        @State private var needsRefrash: Bool = false

    private func populateMovies(){
        movies = coreDM.getAllMovie()
    }
    
    var body: some View {
       
        NavigationView{
           
            VStack {
                
                TextField("Enter title", text: $movieTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
               
                Button("Save") {
                    coreDM.saveMovie(title: movieTitle)
                    populateMovies()
                }
                List{
                    ForEach(movies, id: \.self){ movie in
                        
                        NavigationLink(destination: DetailMovie(movie: movie, coreDM: coreDM, needsRefrash: $needsRefrash),
                           label:{
                                Text(movie.title ?? "")
                                }
                        )
                        
                        
                    }.onDelete(perform: {IndexSet in
                        IndexSet.forEach{ index in
                            let movie = movies[index]
                            coreDM.deleteMovie(movie: movie)
                            populateMovies()
                        }
                    })
                }
                .listStyle(PlainListStyle())
                .accentColor(needsRefrash ? .white : .black)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Movie")
            .onAppear(perform: {
               populateMovies()
            })
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
