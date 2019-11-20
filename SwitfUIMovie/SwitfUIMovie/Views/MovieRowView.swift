//
//  SwiftUIView.swift
//  SwitfUIMovie
//
//  Created by Jorge Mayta Guillermo on 11/19/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct MovieRowView: View {
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    
    var movie: Movie?
    
    var body: some View {
        HStack{
            ImageView(withURL: self.movie!.imageUrlString)

            VStack(alignment: .leading){
                Text(movie!.title).bold()
                Spacer()
                Text(movie!.overView).lineLimit(2)

            }
            Spacer()
            Button(action:{
                self.favoriteVM.addFavorite(title: self.movie!.title)
                self.favoriteVM.getAllFavorites()
            }){
                Image(systemName: "plus")
            }
        }.buttonStyle(BorderlessButtonStyle())
        
    }
    
}
