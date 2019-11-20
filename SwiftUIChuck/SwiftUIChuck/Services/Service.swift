//
//  Service.swift
//  SwiftUIChuck
//
//  Created by Jorge Mayta Guillermo on 11/16/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

let apiUrl = "https://api.chucknorris.io/jokes/random"
let url = URL(string: apiUrl)!

let session = URLSession.shared
