//
//  PokemonDetailCell.swift
//  CollectionViewTeamJoseGen
//
//  Created by Genesis Mosquera on 1/10/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class PokemonDetailCell: UICollectionViewCell {
    @IBOutlet weak var pokemonImage: UIImageView!
    override func prepareForReuse() {
        pokemonImage.image = nil 
    }
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonDamage: UILabel!
    @IBOutlet weak var pokemonText: UITextView!
    
    
    func updateCellUI(pokemon: AttackInfo) {
       pokemonName.text = pokemon.name
        pokemonDamage.text = pokemon.damage
        pokemonText.text = pokemon.text
        
    }
}
