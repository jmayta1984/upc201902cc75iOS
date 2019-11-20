//
//  MovieListViewModel.swift
//  SwitfUIMovie
//
//  Created by PCSIJMAY (MAYTA GUILLERMO, JORGE LUIS) on 11/19/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

class MovieListViewModel: ObservableObject {
    @Published var movies = [Movie]()
    
    init(){
        
        session.dataTask(with: url) {
            data, response, error in
            
            DispatchQueue.main.async {
                let movieReponse = try! JSONDecoder().decode(MovieResponse.self, from: data!)
                
                self.movies = movieReponse.movies
            }
        }.resume()
    }
}
