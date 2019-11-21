//
//  FavoriteViewModel.swift
//  SwitfUIMovie
//
//  Created by PCSIJMAY (MAYTA GUILLERMO, JORGE LUIS) on 11/19/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

class FavoriteViewModel: ObservableObject{
    @Published var favorites = [Favorite]()
    
    func saveContext(){
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func addFavorite(title:String) {
        let favorite = Favorite(context: context)
        favorite.title = title
        favorite.date = Date()
        favorites.append(favorite)
    
    }
    
    
    func deleteFavorite(position: Int){
        let favorite = favorites[position]
        
        context.delete(favorite)
        saveContext()
    }
    
    init (){
        do {
                 self.favorites = try context.fetch(Favorite.fetchRequest())
             } catch (let error){
                 print(error)
             }
    }
}
