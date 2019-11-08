//
//  ContentView.swift
//  Pokedex
//
//  Created by PCSIJMAY (MAYTA GUILLERMO, JORGE LUIS) on 10/17/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var pokedexVM = PokedexViewModel()
    
    
    var body: some View {
        NavigationView {
            
            List (self.pokedexVM.pokemons){pokemon in
                
                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                    
                    Text(pokemon.name)
                    
                }
            }.navigationBarTitle(Text("Pokemons"))
        }.onAppear(){
            self.pokedexVM.getPokemons()
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
