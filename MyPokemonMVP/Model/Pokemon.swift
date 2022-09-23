//
//  Pokemon.swift
//  MyPokemonMVP
//
//  Created by 滝野翔平 on 2022/09/17.
//

import Foundation

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let sprites: Sprites
}

struct Sprites: Decodable {
    var image: String = "front_default"
}
