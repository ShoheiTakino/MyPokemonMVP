//
//  Clients.swift
//  MyPokemonMVP
//
//  Created by 滝野翔平 on 2022/09/17.
//

import Foundation

//https://pokeapi.co/api/v2/item/234/

final class PokemonAPIClients {
    
    func pokemonList() async throws -> [PokemonList] {
        let ids = Constants.pokemonIdRange
        for id in ids {
            let url: URL = URL(string: "https://pokeapi.co/api/v2/item/\(id)/")!
            let request = URLRequest(url: url)
            
            let session: URLSession = URLSession.shared
            let task: URLSessionDataTask = session.dataTask(with: request, completionHandler: {( data, response, error) in
                
                guard let data = data else { return }
                
                if error != nil {
                    print(error ?? "")
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let resultList = try decoder.decode(PokemonList.self, from: data)
                    
                    for pokemon in resultList.results {
                        print(pokemon.id)
                        print(pokemon.name)
                        print(pokemon.url)
                        PokemonList.append(pokemon)
                    }
                } catch {
                    print("解析中にerror")
                }
            })
            task.resume()
        }
    }
}
