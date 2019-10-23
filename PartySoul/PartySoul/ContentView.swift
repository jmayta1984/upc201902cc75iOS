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

let apiUrlDadJoke = "https://icanhazdadjoke.com/"
let urlDadJoke = URL(string: apiUrlDadJoke)!

let session = URLSession.shared

struct Joke: Identifiable, Decodable {
    let id = UUID()
    var joke: String
}

class JokeViewModel: ObservableObject {
    @Published var jokes = [Joke]()
    
    func getGeekJoke() {
        session.dataTask(with: urlGeekJoke){
            (data, response, error) in
            DispatchQueue.main.async {
                self.jokes.append(Joke(joke: String(decoding: data!, as: UTF8.self)))
            }
        }.resume()
    }
    
    func getDadJoke() {
        var request = URLRequest(url: urlDadJoke)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        session.dataTask(with: request){
            (data, response, error) in
            DispatchQueue.main.async {
                
                self.jokes.append( try! JSONDecoder().decode(Joke.self, from: data!))
                
            }
        }.resume()
    }
}

struct ContentView: View {
    
    @ObservedObject var jokeVM = JokeViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(jokeVM.jokes) {joke in
                    Text(joke.joke)
                }
            }
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
