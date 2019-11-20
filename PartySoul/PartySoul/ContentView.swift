//
//  ContentView.swift
//  PartySoul
//
//  Created by Jorge Mayta Guillermo on 10/19/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI
import CoreData

let apiUrlGeekJoke = "https://geek-jokes.sameerkumar.website/api"
let urlGeekJoke = URL(string: apiUrlGeekJoke)!

let apiUrlDadJoke = "https://icanhazdadjoke.com/"
let urlDadJoke = URL(string: apiUrlDadJoke)!

let session = URLSession.shared

struct Joke: Identifiable, Decodable{
    let id = UUID()
    var joke: String
}

class JokeEntity: NSManagedObject, Identifiable {
    @NSManaged var text: String?
    
    static func getAllJokeEntitiesRequest() -> NSFetchRequest<JokeEntity> {
        let request = JokeEntity.fetchRequest() as! NSFetchRequest<JokeEntity>
        return request
    }
}

class JokeViewModel: ObservableObject {
    @Published var jokes = [Joke]()
    @Published var jokeEntities = [JokeEntity]()
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getJokeEntities() {
        let request = JokeEntity.getAllJokeEntitiesRequest()
        do {
            jokeEntities = try context.fetch(request)
        } catch (let error){
            print(error)
        }
    }
    
    func addJokeEntity(text: String){
        let jokeEntity = JokeEntity(context: context)
        jokeEntity.text = text
        saveContext()
    }
    
    func deleteJokeEntity(index: Int) {
        let deletedJokeEntity = jokeEntities[index]
        context.delete(deletedJokeEntity)
        saveContext()
    }
    
    func saveContext()  {
        if context.hasChanges{
            do{
                try context.save()
                getJokeEntities()
            } catch (let error) {
                print(error)
            }
        }
    }
    
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
                Section(header: Text("Networking")){
                    ForEach(jokeVM.jokes) {joke in
                        HStack {
                            Text(joke.joke)
                            Button(action: {self.jokeVM.addJokeEntity(text: joke.joke)}){
                                Image(systemName: "plus")
                            }
                        }
                        
                    }
                }
                Section(header: Text("Core Data")){
                    ForEach(jokeVM.jokeEntities) {jokeEntity in
                        Text(jokeEntity.text!)
                        
                    }.onDelete(){
                        indexSet in
                        self.jokeVM.deleteJokeEntity(index: indexSet.first!)
                    }
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
                .onAppear(){
                    self.jokeVM.getJokeEntities()
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
