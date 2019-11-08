//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by PCSIJMAY (MAYTA GUILLERMO, JORGE LUIS) on 11/5/19.
//  Copyright © 2019 UPC. All rights reserved.
//
import SwiftUI

struct PokemonDetail: Decodable {
    let weight: Int
    let height: Int

    init(){
        self.weight = 0
        self.height = 0
    }
    
}
