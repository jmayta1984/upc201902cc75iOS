//
//  ContentView.swift
//  AgendaSwiftUI
//
//  Created by PCSIJMAY (MAYTA GUILLERMO, JORGE LUIS) on 10/17/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct Contact: Identifiable {
    let id: Int
    let name, number : String
}

struct Course: Identifiable {
    let id: Int
    let name, description : String
}

struct ContentView: View {
    var body: some View {
        TabView {
            ContactView().tabItem{
                Text("Contacts")
            }
            CoursesView().tabItem{
                Text("Courses")
            }

        }
    }
    
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ContactRowView : View {
    let contact: Contact
    
    var body: some View {
        VStack {
            Text(contact.name)
            Text(contact.number)
        }
    }
}


struct ContactView : View {
    @State private var contacts:[Contact] = [.init(id: 0, name: "Mario", number: "526"), .init(id: 1,name: "Luiggi", number: "1234"), .init(id: 2, name: "Carlos", number: "12")]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts, id: \.id) { contact in
                    ContactRowView(contact: contact)
                    
                }.onDelete{offsets in
                    self.contacts.remove(atOffsets: offsets)
                    
                }
            }.navigationBarTitle(Text("Contacts"))
        }
        
    }
    
}

struct CoursesView : View {
    @State private var courses:[Course] = [.init(id: 0, name: "Inglés", description: "Curso de Inglés")]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(courses, id: \.id) { course in
                    Text(course.name)
                }.onDelete{offsets in
                    self.courses.remove(atOffsets: offsets)
                    
                }
            }.navigationBarTitle(Text("Courses"))
        }
        
    }
    
}
