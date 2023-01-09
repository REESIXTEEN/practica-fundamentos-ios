//
//  Heroe.swift
//  practica-fundamentos-ios-dbz
//
//  Created by Pablo Gómez on 9/1/23.
//

import Foundation

struct Heroe: Codable{
    let id: String
    let name: String
    let photo: String
    let description: String
    let favorite: Bool
}
