//
//  PokemonDetailedViewController.swift
//  CollectionViewTeamJoseGen
//
//  Created by Genesis Mosquera on 1/10/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class PokemonDetailedViewController: UIViewController {
    
    
    @IBOutlet weak var pokemonDetailCV: UICollectionView!
    
    
    
    // private var updatePokemonUI = ""
    public var pokemonCards: CardInfo! {
        didSet {
        DispatchQueue.main.async {
            self.pokemonDetailCV.reloadData()
        }
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonDetailCV.dataSource = self
    }
    
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
}
extension PokemonDetailedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonCards.attacks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonDetailCell", for: indexPath)
            as? PokemonDetailCell else { return UICollectionViewCell()}
        ImageHelper.shared.fetchImage(urlString: pokemonCards.imageUrl!) { (appError, image) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let image = image {
                DispatchQueue.main.async {
                    cell.pokemonImage.image = image
                    //
                }
                
            }
        }
        let attacks = pokemonCards.attacks
        cell.updateCellUI(pokemon: attacks[indexPath.row])
        return cell
    }
}
