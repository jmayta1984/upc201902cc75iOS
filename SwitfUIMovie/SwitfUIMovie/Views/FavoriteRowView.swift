//
//  FavoriteRowView.swift
//  SwitfUIMovie
//
//  Created by Jorge Mayta Guillermo on 11/20/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct FavoriteRowView: View {
    
    var favorite: Favorite?
    
    var body: some View {
        VStack{
            Text(favorite!.title!)
        }

    }
}

struct FavoriteRowView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRowView()
    }
}
