//
//  Services.swift
//  SwitfUIMovie
//
//  Created by PCSIJMAY (MAYTA GUILLERMO, JORGE LUIS) on 11/19/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

let urlString = "https://api.themoviedb.org/3/search/movie?api_key=3cae426b920b29ed2fb1c0749f258325&query=frozen"
let urlImage = "https://image.tmdb.org/t/p/w500/"

let url = URL(string: urlString)!

let session = URLSession.shared
