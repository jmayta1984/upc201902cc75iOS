//
//  PokedexViewModel.swift
//  Pokedex
//
//  Created by PCSIJMAY (MAYTA GUILLERMO, JORGE LUIS) on 11/5/19.
//  Copyright © 2019 UPC. All rights reserved.
//
import SwiftUI
let apiUrl = "https://pokeapi.co/api/v2/pokemon"

class PokedexViewModel: ObservableObject {
    
    @Published var pokemons: [Pokemon] = []
    
    @Published var pokemonDetail: PokemonDetail = PokemonDetail()
    
    
    var height: String {
        return String(pokemonDetail.height)
    }
    
    var weight: String {
        return String(pokemonDetail.weight)
    }
    
    func getPokemonDetail(url: String) {
        let url = URL(string: url)
             
             URLSession.shared.dataTask(with: url!) { (data, response, error) in
                 
                 DispatchQueue.main.async {
                     do {
                        self.pokemonDetail = try JSONDecoder().decode(PokemonDetail.self, from: data!)
                        
                     } catch (let jsonError){
                         print(jsonError)
                     }
                 }
             }.resume()
    }
    func getPokemons() {
        
        let url = URL(string: apiUrl)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            DispatchQueue.main.async {
                do {
                    let pokedexResponse = try JSONDecoder().decode(ListPokemon.self, from: data!)
                    self.pokemons = pokedexResponse.results
                } catch (let jsonError){
                    print(jsonError)
                }
            }
        }.resume()
    }
}
