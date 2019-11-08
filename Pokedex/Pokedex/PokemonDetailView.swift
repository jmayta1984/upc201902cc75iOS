//
//  File.swift
//  Pokedex
//
//  Created by PCSIJMAY (MAYTA GUILLERMO, JORGE LUIS) on 11/5/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @ObservedObject var pokedexVM = PokedexViewModel()
    
    
    var pokemon: Pokemon
    
    var body: some View {

        VStack {
            Text(pokemon.name)
            Text(pokedexVM.height)
            Text(pokedexVM.weight)

            
        }.onAppear(){
            self.pokedexVM.getPokemonDetail(url: self.pokemon.url)
            
        }
    }
}
