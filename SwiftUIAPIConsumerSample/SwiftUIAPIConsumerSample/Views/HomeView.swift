//
//  HomeView.swift
//  SwiftUIAPIConsumerSample
//
//  Created by Angel Velasquez on 10/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    NavigationView {
      TabView {
        GodListView().tabItem() {
          Image("zeus")
          Text("Gods")
        }
        Text("Heroes").tabItem {
          Image("artemis")
          Text("Heroes")
        }
        Text("Myths").tabItem {
          Image("myth")
          Text("Myths")
        }
        Text("Locations").tabItem {
          Image("museum")
          Text("Locations")
        }
      }
      .navigationBarTitle(Text("Mythology"))
    }
  }
}


struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
