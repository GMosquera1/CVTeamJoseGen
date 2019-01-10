//
//  PokemonViewController.swift
//  CollectionViewTeamJoseGen
//
//  Created by Genesis Mosquera on 1/9/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    var pokemonImages = [CardInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.PokemonCollectionView.reloadData()
            }
        }
    }
    
    
    
    @IBOutlet weak var PokemonCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
PokemonCollectionView.dataSource = self
PokemonCollectionView.delegate = self
  setUpPokemonVC()
    }
    func setUpPokemonVC() {
        PokemonAPIClient.updatePokemon { (appError, pokemon) in
            if let appError = appError {
                print(appError)
            }
            if let pokemon = pokemon {
                self.pokemonImages = pokemon
            }
        }
    }
    
    }

extension PokemonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath)
            as? PokemonCell else { return UICollectionViewCell()}
        ImageHelper.shared.fetchImage(urlString: pokemonImages[indexPath.row].imageUrl!) { (appError, image) in
            if let appError = appError {
        print(appError.errorMessage())
            } else if let image = image {
                cell.pokemonImageView.image = image
            }
        }
        return cell
    }
}

extension PokemonViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 100, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("we did it")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PokemonDetailedViewController") as? PokemonDetailedViewController else {return}
        vc.modalPresentationStyle = .overCurrentContext
        vc.pokemonCards = pokemonImages[indexPath.row]
        //makes it segue
        present(vc, animated: true, completion: nil)
    }
}
