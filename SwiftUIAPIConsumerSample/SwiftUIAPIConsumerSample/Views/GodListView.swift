//
//  ContentView.swift
//  SwiftUIAPIConsumerSample
//
//  Created by Angel Velasquez on 10/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct GodRow: View {
  var god: GodViewModel
  
  var body: some View {
      Text(god.name)
  }
}

struct GodListView: View {
  @ObservedObject private var godListViewModel = GodListViewModel()
  
  var body: some View {
      List(self.godListViewModel.gods) { god in
        NavigationLink(destination: AboutGodView(god: god)) {
          GodRow(god: god)
        }
      }
      .navigationBarTitle(Text("Gods"), displayMode: .automatic)
  }
}

struct GodListView_Previews: PreviewProvider {
  static var previews: some View {
    GodListView()
  }
}


