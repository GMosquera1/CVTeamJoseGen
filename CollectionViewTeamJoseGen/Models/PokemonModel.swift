//
//  PokemonModel.swift
//  CollectionViewTeamJoseGen
//
//  Created by Genesis Mosquera on 1/9/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation
struct PokemonCards: Codable {
    let cards: [CardInfo]
}
struct CardInfo: Codable {
    let attacks: [AttackInfo]
    let imageUrl: String?
    let imageUrlHiRes: String?
}
struct AttackInfo: Codable {
    let name: String
    let text: String
    let damage: String
}
