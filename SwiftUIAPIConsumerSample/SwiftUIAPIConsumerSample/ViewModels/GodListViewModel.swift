//
//  GodListViewModel.swift
//  SwiftUIAPIConsumerSample
//
//  Created by Angel Velasquez on 10/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

class GodListViewModel: ObservableObject {
  
  @Published var gods = [GodViewModel]()
  
  init() {
    GreekMythsService().getGods { gods in
      
      if let gods = gods {
        self.gods = gods.map(GodViewModel.init)
      }
      
    }
  }
  
}


