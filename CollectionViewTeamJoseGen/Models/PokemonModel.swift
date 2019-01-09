//
//  PokemonModel.swift
//  CollectionViewTeamJoseGen
//
//  Created by Genesis Mosquera on 1/9/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation
struct PokemonModel: Codable {
    let imageUrl: String
    let imageUrlHiRes: String
    let attackWrapper: [attacks]
}
struct attacks: Codable {
    let name: String
    let text: String
    let damage: String
}
