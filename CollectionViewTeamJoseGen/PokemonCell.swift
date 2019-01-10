//
//  PokemonCell.swift
//  CollectionViewTeamJoseGen
//
//  Created by Genesis Mosquera on 1/9/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    override func prepareForReuse() {
        pokemonImageView.image = nil
    }
    
}
