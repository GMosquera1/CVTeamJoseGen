//
//  PokemonAPIClient.swift
//  CollectionViewTeamJoseGen
//
//  Created by Genesis Mosquera on 1/10/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation

final class PokemonAPIClient {
    
    static func updatePokemon(completionHandler: @escaping (AppError?, [CardInfo]?) -> Void) {
    NetworkHelper.shared.performDataTask(endpointURLString: "https://api.pokemontcg.io/v1/cards?contains=imageUrl,imageUrlHiRes,attacks") { (appError, data, httpResponse) in
        if let data = data {
            do {
                let PokemonData = try JSONDecoder().decode(PokemonCards.self, from: data).cards.filter(){$0.imageUrl != nil}
               // self.pokemonImages = PokemonData
                completionHandler(nil, PokemonData)
            } catch {
                print(error)
            }
        }
        if let appError = appError {
            print(appError.errorMessage())
        }
    }
}
}
