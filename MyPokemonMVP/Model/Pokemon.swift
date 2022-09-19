//
//  Pokemon.swift
//  MyPokemonMVP
//
//  Created by 滝野翔平 on 2022/09/17.
//

import Foundation

struct PokemonList: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let id: Int
    let name: String
    let url: URL
}
