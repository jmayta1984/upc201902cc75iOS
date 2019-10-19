//
//  ContentView.swift
//  PartySoul
//
//  Created by Jorge Mayta Guillermo on 10/19/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import SwiftUI

let apiUrlGeekJoke = "https://geek-jokes.sameerkumar.website/api"
let urlGeekJoke = URL(string: apiUrlGeekJoke)!
let sessionGeekJoke = URLSession.shared

let apiUrlDadJoke = "https://icanhazdadjoke.com/"
let urlDadJoke = URL(string: apiUrlDadJoke)!
let sessionDadJoke = URLSession.shared

struct Joke: Decodable {
    let id: String
    var joke: String
}

class JokeViewModel: ObservableObject {
    @Published var joke = Joke(id: "", joke: "")
    
    func getGeekJoke() {
        sessionDadJoke.dataTask(with: urlGeekJoke){
            (data, response, error) in
            DispatchQueue.main.async {
                self.joke.joke = String(decoding: data!, as: UTF8.self)
            }
        }.resume()
    }
    
    func getDadJoke() {
        var request = URLRequest(url: urlDadJoke)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        sessionDadJoke.dataTask(with: request){
            (data, response, error) in
            DispatchQueue.main.async {
                do {
                    self.joke = try JSONDecoder().decode(Joke.self, from: data!)
                } catch (let jsonError) {
                    print(jsonError)
                }
            }
        }.resume()
    }
}

struct ContentView: View {
    
    @ObservedObject var jokeVM = JokeViewModel()
    
    var body: some View {
        NavigationView {
            Text(jokeVM.joke.joke)
                .navigationBarTitle("Jokes")
                .navigationBarItems(
                    leading: Button(action: {
                        self.jokeVM.getGeekJoke()
                    }, label: {Text("Geek Joke")}),
                    trailing: Button(action: {
                        self.jokeVM.getDadJoke()
                    }, label: {Text("Dad Joke")}))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
