//
//  MagicModel.swift
//  CollectionViewTeamJoseGen
//
//  Created by Genesis Mosquera on 1/9/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation

struct MagicModel: Codable {
    let cards: [Card]
}
struct Card: Codable {
    let name: String
    let imageUrl: String?
    let text: String
    let foreignNames: [ForeignWrapper]
}

struct ForeignWrapper: Codable {
    let name: String
    let text: String
    let imageUrl: String?
    let language: String
}

