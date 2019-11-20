//
//  JokeView.swift
//  SwiftUIChuck
//
//  Created by Jorge Mayta Guillermo on 11/16/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct JokeView: View {
    @ObservedObject var jokeVM = JokeViewModel()
    
    var body: some View {
        List(jokeVM.jokes){ joke in
            JokeCellView()
        }
        .onAppear(){
            self.fetchJoke()
        }
        
    }
    
    func fetchJoke() {
        session.dataTask(with: url){
            (data, response, error) in
            let jokeResponse = try! JSONDecoder().decode(JokeResponse.self, from: data!)
            DispatchQueue.main.async {
                
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                
                let joke = Joke(context: context)
                joke.value = jokeResponse.value
                joke.id = jokeResponse.id
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                
                self.jokeVM.jokes.append(joke)
            }
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
    }
}
