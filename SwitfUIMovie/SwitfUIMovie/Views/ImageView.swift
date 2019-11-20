//
//  ImageView.swift
//  SwitfUIMovie
//
//  Created by Jorge Mayta Guillermo on 11/20/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    
    var body: some View {
        
        HStack{
            Image(uiImage: imageLoader.dataIsValid ? imageFromData(imageLoader.data!) : UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 0, maxWidth: 64, minHeight: 0, maxHeight: 64)
            
            
            
        }
        
        
    }
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
    
    
    func imageFromData(_ data:Data) -> UIImage {
        UIImage(data: data) ?? UIImage()
    }
}

