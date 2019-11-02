//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by Jorge Mayta Guillermo on 11/2/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var textTask = ""
    
    @ObservedObject var taskVM = TaskViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section(header:Text("New task")){
                    HStack {
                        TextField("Type new task", text: $textTask)
                        Button(action: {
                            if self.textTask != "" {
                                self.taskVM.addTask(textTask: self.textTask)
                                self.textTask = ""
                            }
                        }){
                            Image(systemName: "plus")
                        }
                    }
                }
                Section(header: Text("Tasks")){
                    ForEach(self.taskVM.tasks) {
                        task in
                        TaskCellView(task: task)
                    }.onDelete {
                        indexSet in
                        self.taskVM.deleteTask(index: indexSet.first!)
                    }
                }
            }.navigationBarTitle("Tasks").onAppear{self.taskVM.getTasks()}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
