//
//  ContentView.swift
//  SwiftUIChuck
//
//  Created by Jorge Mayta Guillermo on 11/16/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            
            VStack {
                Text("No Jokes Jet")
            }.navigationBarItems(trailing:  NavigationLink(destination: JokeView()) {
                Text("Jokes")
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
