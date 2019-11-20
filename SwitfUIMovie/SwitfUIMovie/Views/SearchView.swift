//
//  SearchView.swift
//  SwitfUIMovie
//
//  Created by PCSIJMAY (MAYTA GUILLERMO, JORGE LUIS) on 11/19/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var movieListVM = MovieListViewModel()
    
    var body: some View {
        List{
            ForEach(self.movieListVM.movies) {movie in
                MovieRowView(movie: movie)
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
