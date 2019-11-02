//
//  TaskViewModel.swift
//  ToDoSwiftUI
//
//  Created by Jorge Mayta Guillermo on 11/2/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    @Published var tasks = [Task]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getTasks() {
        let request = Task.getAllTaskRequest()
        do {
            tasks = try context.fetch(request)
        } catch (let error){
            print(error)
        }
    }
    
    func addTask(textTask: String){
        let task = Task(context: context)
        task.text = textTask
        saveContext()
    }
    
    func deleteTask(index: Int) {
        let deletedTask = tasks[index]
        context.delete(deletedTask)
        saveContext()
    }
    
    func saveContext()  {
        if context.hasChanges{
            do{
                try context.save()
                getTasks()
            } catch (let error) {
                print(error)
            }
        }
    }
}
