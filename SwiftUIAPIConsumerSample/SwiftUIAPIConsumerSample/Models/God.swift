//
//  God.swift
//  SwiftUIAPIConsumerSample
//
//  Created by Angel Velasquez on 10/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

struct God: Codable {
  
  var name: String
  var romanname: String
  var power: String
  var symbol: String
  var father: String
  var mother: String
  
  init() {
    name = "No Name"
    romanname = "No Name"
    power = "None"
    symbol = "None"
    father = "Unknown"
    mother = "Unknown"
  }
}
