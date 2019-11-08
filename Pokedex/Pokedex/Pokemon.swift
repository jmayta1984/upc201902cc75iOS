//
//  Pokemon.swift
//  Pokedex
//
//  Created by PCSIJMAY (MAYTA GUILLERMO, JORGE LUIS) on 11/5/19.
//  Copyright © 2019 UPC. All rights reserved.
//
import SwiftUI

struct Pokemon: Identifiable,Decodable {
    let id = UUID()
    let name: String
    let url: String

}
