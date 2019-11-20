//
//  JokeCellView.swift
//  SwiftUIChuck
//
//  Created by Jorge Mayta Guillermo on 11/16/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct JokeCellView: View {
    var text: String?
    
    var body: some View {
        
        VStack{
            Text("Hola")
            HStack{
                Button(action:{}){
                    Image("ic_favorite").resizable().scaledToFit().padding()

                }
                Button(action:{}){
                    Image("ic_favorite").resizable().scaledToFit().padding()

                }
                Button(action:{}){
                    Image("ic_favorite").resizable().scaledToFit().padding()

                }
                Button(action:{}){
                    Image("ic_favorite").resizable().scaledToFit().padding()

                }
                Button(action:{}){
                    Image("ic_favorite").resizable().scaledToFit().padding()

                }
                
                
            }
        }
        
        
        
    }
}

struct JokeCellView_Previews: PreviewProvider {
    static var previews: some View {
        JokeCellView()
    }
}
