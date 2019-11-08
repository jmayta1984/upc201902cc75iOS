//
//  AboutGodView.swift
//  SwiftUIAPIConsumerSample
//
//  Created by Angel Velasquez on 10/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct AboutGodView: View {
  var god: GodViewModel
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        Spacer()
        HStack(alignment: .top) {
          Text("Roman Name: ").bold()
          Text("\(god.romanName)")
        }
        HStack {
          Text("Powers: ").bold()
          Text("\(god.power)")
        }
        HStack {
          Text("Parents: ").bold()
          Text("\(god.father) and \(god.mother)")
        }
        HStack {
          Text("Symbol: ").bold()
          Text("\(god.symbol)")
        }
        Spacer()
        Button(action: {}) {
            Text("Favorite")
          }
        .scaledToFill()
          .frame(minWidth: 100, idealWidth: 200, maxWidth: 350)
        .padding()
        .background(Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(10)
      }
      .navigationBarTitle("About \(god.name)")
    }
    
    
  }
  
}

struct AboutGodView_Previews: PreviewProvider {
  static var previews: some View {
    AboutGodView(god: GodViewModel(god: God()))
  }
}
