//
//  ContentView.swift
//  Pokedex
//
//  Created by Jorge Mayta Guillermo on 10/19/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import SwiftUI

let apiUrl = "https://pokeapi.co/api/v2/pokemon"
let url = URL(string: apiUrl)!
let session = URLSession.shared

struct Pokemon: Identifiable, Decodable {
    let id = UUID()
    let name: String
}

struct PokemonResponse: Decodable {
    let results:[Pokemon]
}

class PokemonViewModel: ObservableObject {
    @Published var pokemons = [Pokemon]()
    
    func getPokemons() {
        session.dataTask(with: url) {
            (data, response, error) in
            DispatchQueue.main.async {
                self.pokemons = try! JSONDecoder().decode(PokemonResponse.self, from: data!).results
            }
        }.resume()
    }
}

struct ContentView: View {
    
    @ObservedObject var pokemonVM = PokemonViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(pokemonVM.pokemons) { pokemon in
                    Text(pokemon.name)
                }
            }.navigationBarTitle(Text("Pokedex"))
        }.onAppear{
            self.pokemonVM.getPokemons()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
