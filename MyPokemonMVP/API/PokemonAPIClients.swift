//
//  Clients.swift
//  MyPokemonMVP
//
//  Created by 滝野翔平 on 2022/09/17.
//

import Foundation

final class PokemonAPIClients {
    
    var PokemonLists: [Pokemon] = []
    
    func fetchpokemonList(){
        
        let ids = Constants.pokemonIdRange
        for id in ids {
            guard let url: URL = URL(string: "https://pokeapi.co/api/v2/item/\(id)/") else { return }
            
            let request = URLRequest(url: url)
            
            let session: URLSession = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            
            let task: URLSessionDataTask = session.dataTask(with: request, completionHandler: {
                ( data, response, error) in
                
                session.finishTasksAndInvalidate()
                
                do{
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(Pokemon.self, from: data!)
                    print(json)
                    self.PokemonLists.append(json)
                } catch {
                    print("解析中にerror")
                }
            })
            PokemonLists.sort(by: { $0.id < $1.id })
            task.resume()
        }
    }
}
