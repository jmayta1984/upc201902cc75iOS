//
//  Joke.swift
//  SwiftUIChuck
//
//  Created by Jorge Mayta Guillermo on 11/16/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import CoreData

class Joke: NSManagedObject, Identifiable {
    @NSManaged var id: String?
    @NSManaged var value: String?

    
    static func getAllJokesRequest() -> NSFetchRequest<Joke> {
        let request = Joke.fetchRequest() as! NSFetchRequest<Joke>
        return request
    }
}
