//
//  WebService.swift
//  SwiftUIAPIConsumerSample
//
//  Created by Angel Velasquez on 10/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

class GreekMythsService {
  func getGods(completion: @escaping ([God]?) -> ()) {
    guard let url = URL(string: "http://private-b12184-greekmythology1.apiary-mock.com/gods") else {
      fatalError("Invalid URL")
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else {
        completion(nil)
        if let error = error {
          print(error.localizedDescription)
        }
        return
      }
      
      
      let gods = try? JSONDecoder().decode([God].self, from: data)
      DispatchQueue.main.async {
        completion(gods)
      }

      if let error = error {
        print(error.localizedDescription)
      }

    }.resume()
  }
}
