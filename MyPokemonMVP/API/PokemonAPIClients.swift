//
//  Clients.swift
//  MyPokemonMVP
//
//  Created by 滝野翔平 on 2022/09/17.
//

import Foundation

//https://pokeapi.co/api/v2/item/234/

final class PokemonAPIClients {
    
    func pokemonList() async throws -> [Pokemon] {
        let id = Constants.pokemonIdRange
        let url = URL(string: "https://pokeapi.co/api/v2/item/\(id)/")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in  //非同期で通信を行う
            guard let data = data else { return }
            do {
                let object = try JSONSerialization.jsonObject(with: data, options: [])  // DataをJsonに変換
                print(object)
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
}
