//
//  JokeViewModel.swift
//  SwiftUIChuck
//
//  Created by Jorge Mayta Guillermo on 11/16/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI
import CoreData

class JokeViewModel: ObservableObject {
    @Published var jokes = [Joke]()
}
