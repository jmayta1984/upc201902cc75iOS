//
//  Task.swift
//  ToDoSwiftUI
//
//  Created by Jorge Mayta Guillermo on 11/2/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import CoreData

class Task: NSManagedObject, Identifiable {
    @NSManaged var text: String?
    @NSManaged var createdAt: Date?
    
    
    static func getAllTaskRequest() -> NSFetchRequest<Task>{
        
        let request = Task.fetchRequest() as! NSFetchRequest<Task>
        request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: true)]
        return request
        
    }
}
